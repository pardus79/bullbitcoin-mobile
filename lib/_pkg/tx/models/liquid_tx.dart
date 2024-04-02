// ignore_for_file: avoid_print, invalid_annotation_target

import 'package:bb_arch/_pkg/constants.dart';
import 'package:bb_arch/_pkg/wallet/models/liquid_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
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

  static Future<Tx> loadFromNative(dynamic tx, LiquidWallet wallet) async {
    if (tx is! lwk.Tx) {
      throw TypeError();
    }

    String assetIdToPick = wallet.network == NetworkType.Mainnet ? lwk.lBtcAssetId : lwk.lTestAssetId;

    lwk.Tx t = tx;
    final balances = t.balances;
    int finalBalance = balances.where((b) => b.$1 == assetIdToPick).map((e) => e.$2).first;
    return LiquidTx(id: t.txid, amount: finalBalance, fee: t.fee, type: TxType.Liquid, timestamp: t.timestamp);
  }
}
