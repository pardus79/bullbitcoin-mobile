import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// part of 'home_cubit.dart';

part 'home_state.freezed.dart';
// part 'home_state.g.dart';

enum WalletStatus { initial, loading, success, failure }

extension WalletStatusExtension on WalletStatus {
  String get name {
    switch (this) {
      case WalletStatus.initial:
        return 'initial';
      case WalletStatus.loading:
        return 'loading';
      case WalletStatus.success:
        return 'success';
      case WalletStatus.failure:
        return 'failure';
    }
  }
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(WalletStatus.initial) WalletStatus status,
    @Default([]) List<WalletStatus> syncWalletStatus,
    @Default([]) List<Wallet> wallets,
    @Default('') String error,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(wallets: []);
}
