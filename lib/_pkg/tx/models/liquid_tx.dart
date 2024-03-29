// ignore_for_file: avoid_print, invalid_annotation_target

import 'package:bb_arch/_pkg/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:json_annotation/json_annotation.dart';
import 'package:lwk_dart/lwk_dart.dart' as lwk;
import 'tx.dart';

part 'liquid_tx.freezed.dart';
part 'liquid_tx.g.dart';

@freezed
class LiquidTx extends Tx with _$LiquidTx {
  factory LiquidTx({
    required String id,
    required int amount,
    required int fee,
    required int timestamp,
    required TxType type,
  }) = _LiquidTx;
  LiquidTx._();

  factory LiquidTx.fromJson(Map<String, dynamic> json) => _$LiquidTxFromJson(json);

  static Future<Tx> loadFromNative(dynamic tx) async {
    if (tx is! lwk.Tx) {
      throw TypeError();
    }

    lwk.Tx t = tx;
    final balances = t.balances;
    int finalBalance = balances.where((b) => b.$1 == lwk.lTestAssetId).map((e) => e.$2).first ?? 0;
    return LiquidTx(id: t.txid, amount: finalBalance, fee: t.fee ?? 0, type: TxType.Liquid, timestamp: t.timestamp);
  }
}
