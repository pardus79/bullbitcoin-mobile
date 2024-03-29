// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/_pkg/wallet/wallet_repository.dart';
import 'package:bb_arch/wallet/bloc/wallet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_event.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository walletRepository;
  Timer? _loadWalletsTimer;

  WalletBloc({required this.walletRepository}) : super(WalletState.initial()) {
    on<LoadAllWallets>(_onLoadAllWallets);
    on<SyncAllWallets>(_onSyncAllWallets);
    on<SyncWallet>(_onSyncWallet);
    on<SelectWallet>(_onSelectWallet);

    _loadWalletsTimer = Timer.periodic(const Duration(minutes: 10), (timer) {
      add(SyncAllWallets());
    });
  }

  @override
  Future<void> close() {
    _loadWalletsTimer?.cancel();
    return super.close();
  }

  void _onLoadAllWallets(LoadAllWallets event, Emitter<WalletState> emit) async {
    emit(state.copyWith(status: LoadStatus.loading));

    final (wallets, err) = await walletRepository.loadAllWallets();
    if (err != null) {
      emit(state.copyWith(wallets: [], syncWalletStatus: [], status: LoadStatus.failure, error: err.toString()));
      return;
    }
    emit(state.copyWith(
        wallets: wallets!,
        syncWalletStatus: wallets.map((e) => LoadStatus.initial).toList(),
        status: LoadStatus.success));
  }

  // TODO: Or somehow dispatch SyncWallet for each wallet from here; Is it really needed?
  void _onSyncAllWallets(SyncAllWallets event, Emitter<WalletState> emit) async {
    emit(state.copyWith(syncWalletStatus: state.wallets.map((e) => LoadStatus.loading).toList()));

    List<Future<Wallet>> syncedFutures = state.wallets.map((w) => Wallet.syncWallet(w)).toList();

    var completer = Completer();

    int syncedCount = 0;
    for (int i = 0; i < syncedFutures.length; i++) {
      syncedFutures[i].then((Wallet result) {
        if (++syncedCount == syncedFutures.length) {
          completer.complete();
        }
        emit(state.copyWith(wallets: [
          ...state.wallets.sublist(0, i),
          result,
          ...state.wallets.sublist(i + 1),
        ], syncWalletStatus: [
          ...state.syncWalletStatus.sublist(0, i),
          LoadStatus.success,
          ...state.syncWalletStatus.sublist(i + 1),
        ]));
        print('Future at index $i completed with result: $result');
      }).catchError((error) {
        if (++syncedCount == syncedFutures.length) {
          completer.complete();
        }
        print('Future at index $i completed with error: $error');
      });
    }

    await completer.future;
    print('OnSyncAllWallets: DONE');
  }

  void _onSyncWallet(SyncWallet event, Emitter<WalletState> emit) async {}

  void _onSelectWallet(SelectWallet event, Emitter<WalletState> emit) async {
    emit(state.copyWith(selectedWallet: event.wallet));
  }
}
