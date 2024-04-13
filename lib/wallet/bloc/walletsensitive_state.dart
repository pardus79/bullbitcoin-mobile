import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'walletsensitive_state.freezed.dart';

@freezed
class WalletSensitiveState with _$WalletSensitiveState {
  const factory WalletSensitiveState({
    @Default(LoadStatus.initial) LoadStatus status,
    @Default([]) List<LoadStatus> syncDerivedWalletStatus,
    @Default([]) List<Wallet> derivedWallets,
    @Default('') String error,
  }) = _WalletSensitiveState;

  factory WalletSensitiveState.initial() => const WalletSensitiveState(derivedWallets: []);
}
