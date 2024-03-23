// ignore_for_file: avoid_print

import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/_pkg/wallet/wallet_repository.dart';
import 'package:bb_arch/home/cubit/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// Move to WalletBloc
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required WalletRepository walletRep})
      : walletRepository = walletRep,
        super(HomeState.initial());

  WalletRepository walletRepository;

  void readWallets() async {
    emit(state.copyWith(status: WalletStatus.loading));

    final (wallets, err) = await walletRepository.readAllWallets();
    if (err != null) {
      emit(state.copyWith(wallets: [], syncWalletStatus: [], status: WalletStatus.failure, error: err.toString()));
      return;
    }
    emit(state.copyWith(
        wallets: wallets!,
        syncWalletStatus: wallets.map((e) => WalletStatus.initial).toList(),
        status: WalletStatus.success));
  }

  void syncAllWallets() async {
    emit(state.copyWith(syncWalletStatus: state.wallets.map((e) => WalletStatus.loading).toList()));
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

    for (int i = 0; i < syncedFutures.length; i++) {
      syncedFutures[i].then((result) {
        emit(state.copyWith(wallets: [
          ...state.wallets.sublist(0, i),
          result,
          ...state.wallets.sublist(i + 1),
        ], syncWalletStatus: [
          ...state.syncWalletStatus.sublist(0, i),
          WalletStatus.success,
          ...state.syncWalletStatus.sublist(i + 1),
        ]));
        print('Future at index $i completed with result: $result');
      }).catchError((error) {
        print('Future at index $i completed with error: $error');
      });
    }
  }
}
