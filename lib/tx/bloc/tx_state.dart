import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tx_state.freezed.dart';

@freezed
class TxState with _$TxState {
  const factory TxState({
    @Default(LoadStatus.initial) LoadStatus status,
    @Default([]) List<Tx> txs,
    @Default(null) Tx? selectedTx,
    @Default('') String error,
  }) = _TxState;
}
