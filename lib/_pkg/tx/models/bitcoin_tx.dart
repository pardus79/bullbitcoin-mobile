// ignore_for_file: avoid_print, invalid_annotation_target

import 'package:bb_arch/_pkg/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:json_annotation/json_annotation.dart';
import 'package:bdk_flutter/bdk_flutter.dart' as bdk;
import 'tx.dart';

part 'bitcoin_tx.freezed.dart';
part 'bitcoin_tx.g.dart';

@freezed
class BitcoinTx extends Tx with _$BitcoinTx {
  factory BitcoinTx({
    required String id,
    required int amount,
    required int fee,
    required int timestamp,
    required TxType type,
  }) = _BitcoinTx;
  BitcoinTx._();

  factory BitcoinTx.fromJson(Map<String, dynamic> json) => _$BitcoinTxFromJson(json);

  static Future<Tx> loadFromNative(dynamic tx) async {
    if (tx is! bdk.TransactionDetails) {
      throw TypeError();
    }

    bdk.TransactionDetails t = tx;
    return BitcoinTx(
        id: t.txid,
        amount: t.sent - t.received,
        fee: t.fee ?? 0,
        type: TxType.Bitcoin,
        timestamp: t.confirmationTime?.timestamp ?? 0);
  }
}
