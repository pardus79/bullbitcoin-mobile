// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/seed/models/seed.dart';
import 'package:bb_arch/_pkg/seed/seed_repository.dart';
import 'package:bb_arch/_pkg/wallet/bitcoin_wallet_helper.dart';
import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/liquid_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/_pkg/wallet/wallet_repository.dart';
import 'package:bb_arch/wallet/bloc/wallet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_event.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository walletRepository;
  final SeedRepository seedRepository;
  Timer? _loadWalletsTimer;

  WalletBloc({required this.walletRepository, required this.seedRepository}) : super(WalletState.initial()) {
    on<LoadAllWallets>(_onLoadAllWallets);
    on<SyncAllWallets>(_onSyncAllWallets);
    on<SyncWallet>(_onSyncWallet);
    on<SelectWallet>(_onSelectWallet);
    on<PersistWallet>(_onPersistWallet);

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

    final (wallets, err) = await walletRepository.loadWallets();
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
  // TODO: [UI Optimize]
  // WalletList is built based on state.wallets. And each wallet update results in
  // updating the entire state.wallets list. So entire list gets rebuilt, for each wallet sync.
  // This could be avoided by storing wallet states more granularly, and having wallet specific sync events/updates.
  void _onSyncAllWallets(SyncAllWallets event, Emitter<WalletState> emit) async {
    emit(state.copyWith(status: LoadStatus.loading));
    emit(state.copyWith(syncWalletStatus: state.wallets.map((e) => LoadStatus.loading).toList()));

    List<Wallet> loadedWallets = [];
    for (int i = 0; i < state.wallets.length; i++) {
      final w = state.wallets[i];
      Wallet newWallet = w;
      if (w is BitcoinWallet) {
        if (w.bdkWallet == null) {
          final (seed, _) = await seedRepository.loadSeed(w.seedFingerprint);
          newWallet = await BitcoinWalletHelper.loadNativeSdk(w, seed!);
        }
      } else if (w is LiquidWallet) {
        LiquidWallet lw = w;
        if (lw.lwkWallet == null) {
          newWallet = await LiquidWallet.loadNativeSdk(lw);
        }
      }
      loadedWallets.add(newWallet);
    }

    emit(state.copyWith(wallets: loadedWallets));

    List<Future<Wallet>> syncedFutures = state.wallets.map((w) {
      return Wallet.syncWallet(w);
    }).toList();

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
    // await walletRepository.persistWallet(state.wallets);
    // await Future.delayed(const Duration(seconds: 5));
    emit(state.copyWith(status: LoadStatus.success));
    print('OnSyncAllWallets: DONE');
  }

  void _onSyncWallet(SyncWallet event, Emitter<WalletState> emit) async {}

  void _onSelectWallet(SelectWallet event, Emitter<WalletState> emit) async {
    emit(state.copyWith(selectedWallet: event.wallet));
  }

  void _onPersistWallet(PersistWallet event, Emitter<WalletState> emit) async {
    emit(state.copyWith(wallets: [...state.wallets, event.wallet]));
    await walletRepository.persistWallet(event.wallet);
    // await Future.delayed(const Duration(milliseconds: 10000));
    add(LoadAllWallets());
  }
}
