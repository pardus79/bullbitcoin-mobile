import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    @Default(LoadStatus.initial) LoadStatus status,
    @Default([]) List<LoadStatus> syncWalletStatus,
    @Default([]) List<Wallet> wallets,
    @Default('') String error,
  }) = _WalletState;

  factory WalletState.initial() => const WalletState(wallets: []);
}
