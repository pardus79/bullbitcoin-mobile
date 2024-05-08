import 'package:bb_arch/_pkg/misc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_recover_page_state.freezed.dart';

@freezed
class WalletRecoverPageState with _$WalletRecoverPageState {
  const factory WalletRecoverPageState({
    @Default(LoadStatus.initial) LoadStatus status,
    @Default('') String error,
  }) = _WalletRecoverPageState;
}
