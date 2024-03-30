import 'package:freezed_annotation/freezed_annotation.dart';

part 'tx_page_state.freezed.dart';

@freezed
class TxPageState with _$TxPageState {
  const factory TxPageState({
    @Default('') String error,
  }) = _TxPageState;
}
