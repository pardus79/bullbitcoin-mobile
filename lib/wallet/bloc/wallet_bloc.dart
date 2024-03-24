// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/_pkg/wallet/wallet_repository.dart';
import 'package:bb_arch/wallet/bloc/wallet_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wallet_event.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository walletRepository;
  WalletBloc({required this.walletRepository}) : super(WalletState.initial()) {
    on<ReadAllWallets>(_onReadAllWallet);
    on<SyncAllWallets>(_onSyncAllWallets);
    on<SyncWallet>(_onSyncWallet);
  }

  void _onReadAllWallet(ReadAllWallets event, Emitter<WalletState> emit) async {
    emit(state.copyWith(status: LoadStatus.loading));

    final (wallets, err) = await walletRepository.readAllWallets();
    if (err != null) {
      emit(state.copyWith(wallets: [], syncWalletStatus: [], status: LoadStatus.failure, error: err.toString()));
      return;
    }
    emit(state.copyWith(
        wallets: wallets!,
        syncWalletStatus: wallets.map((e) => LoadStatus.initial).toList(),
        status: LoadStatus.success));
  }

  void _onSyncAllWallets(SyncAllWallets event, Emitter<WalletState> emit) async {
    emit(state.copyWith(syncWalletStatus: state.wallets.map((e) => LoadStatus.loading).toList()));
    // TODO: This is dumb. Refactor it.
    // Loading native wallet should be the responsibility of the Wallet Model.
    // But couldn't make it work with a instance method. Have to TRY HARD again!
    Iterable<Future<Wallet>> loadedWithNativeFutures = state.wallets.map((w) async {
      if (w.type == WalletType.Bitcoin && w.bdkWallet == null) {
        w = await Wallet.loadNativeSdk(w);
      } else if (w.type == WalletType.Liquid && w.lwkWallet == null) {
        w = await Wallet.loadNativeSdk(w);
      }
      return w;
    });
    Iterable<Wallet> loadedWallets = await Future.wait(loadedWithNativeFutures);

    List<Future<Wallet>> syncedFutures = loadedWallets.map((w) => Wallet.syncWallet(w)).toList();

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
}
