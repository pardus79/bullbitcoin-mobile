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
        syncWalletStatus: state.wallets.map((e) => WalletStatus.initial).toList(),
        status: WalletStatus.success));
  }

  void loadNativeSdks() async {
    List<Future<Wallet>> loadedWithNativeFutures = state.wallets.map((w) => Wallet.loadNativeSdk(w)).toList();
    List<Wallet> loadedWallets = await Future.wait(loadedWithNativeFutures);
    emit(state.copyWith(wallets: loadedWallets));
  }

  void syncAllWallets() async {
    List<Future<Wallet>> loadedWithNativeFutures = state.wallets.map((w) => Wallet.syncWallet(w)).toList();
    List<Wallet> loadedWallets = await Future.wait(loadedWithNativeFutures);
    emit(state.copyWith(wallets: loadedWallets));
  }
}
