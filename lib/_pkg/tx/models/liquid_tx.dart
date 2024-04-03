// ignore_for_file: avoid_print, invalid_annotation_target

import 'package:bb_arch/_pkg/wallet/models/liquid_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hex/hex.dart';
// import 'package:json_annotation/json_annotation.dart';
import 'package:bdk_flutter/bdk_flutter.dart' as bdk;
import 'package:lwk_dart/lwk_dart.dart' as lwk;
import 'tx.dart';

part 'liquid_tx.freezed.dart';
part 'liquid_tx.g.dart';

const hexDecoder = HexDecoder();

// TODO: Update LiquitTx to manage USDT, based on requirement
@freezed
class LiquidTx extends Tx with _$LiquidTx {
  factory LiquidTx({
    required String id,
    required TxType type,
    required int timestamp,
    required int amount,
    required int fee,
    required int height,
    required String label,
    required int version,
    required int vsize,
    required int size,
    required int weight,
    required int locktime,
    required List<LiquidTxIn> inputs,
    required List<LiquidTxOut> outputs,
    required String toAddress,
    required String? walletId,
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

    List<LiquidTxIn> inputs = [];
    for (int i = 0; i < t.inputs.length; i++) {
      final txIn = await LiquidTxIn.fromNative(t.inputs[i]);
      inputs.add(txIn);
    }

    List<LiquidTxOut> outputs = [];
    for (int i = 0; i < t.outputs.length; i++) {
      final txOut = await LiquidTxOut.fromNative(t.outputs[i], wallet.network);
      outputs.add(txOut);
    }

    return LiquidTx(
      id: t.txid,
      type: TxType.Liquid,
      timestamp: t.timestamp,
      amount: finalBalance,
      fee: t.fee,
      height: 0,
      label: '',
      version: 1,
      vsize: 0,
      size: 0,
      weight: 0,
      locktime: 0,
      inputs: inputs,
      outputs: outputs,
      toAddress: '',
      walletId: wallet.id, //
    );
  }
}

@freezed
class LiquidOutPoint with _$LiquidOutPoint {
  factory LiquidOutPoint({required String txid, required int vout}) = _LiquidOutPoint;
  LiquidOutPoint._();
  factory LiquidOutPoint.fromJson(Map<String, dynamic> json) => _$LiquidOutPointFromJson(json);
}

// TODO: Incomplete: Need update in lwk-dart
@freezed
class LiquidTxIn with _$LiquidTxIn {
  static Future<LiquidTxIn> fromNative(lwk.TxOut txIn) async {
    try {
      return LiquidTxIn(
        previousOutput: LiquidOutPoint(txid: txIn.outpoint.txid, vout: txIn.outpoint.vout),
        scriptSig: txIn.scriptPubkey,
      );
    } catch (e) {
      print('Error: $e');
      return LiquidTxIn(previousOutput: LiquidOutPoint(txid: '', vout: 0), scriptSig: '');
    }
  }

  factory LiquidTxIn({
    required LiquidOutPoint previousOutput,
    required String scriptSig,
  }) = _LiquidTxIn;
  LiquidTxIn._();

  factory LiquidTxIn.fromJson(Map<String, dynamic> json) => _$LiquidTxInFromJson(json);
}

// TODO: Incomplete: Need update in lwk-dart
@freezed
class LiquidTxOut with _$LiquidTxOut {
  static Future<LiquidTxOut> fromNative(lwk.TxOut txOut, NetworkType network) async {
    try {
      return LiquidTxOut(value: txOut.unblinded.value, scriptPubKey: txOut.scriptPubkey, address: txOut.scriptPubkey);
    } catch (e) {
      print('Error: $e');
      return LiquidTxOut(value: 0, scriptPubKey: '', address: '');
    }
  }

  factory LiquidTxOut({required int value, required String scriptPubKey, required String address}) = _LiquidTxOut;
  LiquidTxOut._();

  factory LiquidTxOut.fromJson(Map<String, dynamic> json) => _$LiquidTxOutFromJson(json);
}
