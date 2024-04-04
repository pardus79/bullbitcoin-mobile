// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitcoin_tx.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BitcoinTxImpl _$$BitcoinTxImplFromJson(Map<String, dynamic> json) =>
    _$BitcoinTxImpl(
      id: json['id'] as String,
      type: $enumDecode(_$TxTypeEnumMap, json['type']),
      timestamp: json['timestamp'] as int,
      amount: json['amount'] as int,
      fee: json['fee'] as int,
      height: json['height'] as int,
      rbfEnabled: json['rbfEnabled'] as bool,
      version: json['version'] as int,
      vsize: json['vsize'] as int,
      weight: json['weight'] as int,
      locktime: json['locktime'] as int,
      inputs: (json['inputs'] as List<dynamic>)
          .map((e) => BitcoinTxIn.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputs: (json['outputs'] as List<dynamic>)
          .map((e) => BitcoinTxOut.fromJson(e as Map<String, dynamic>))
          .toList(),
      toAddress: json['toAddress'] as String,
      labels: (json['labels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      walletId: json['walletId'] as String?,
    )
      ..label = json['label'] as String?
      ..psbt = json['psbt'] as String?
      ..broadcastTime = json['broadcastTime'] as int?;

Map<String, dynamic> _$$BitcoinTxImplToJson(_$BitcoinTxImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'psbt': instance.psbt,
      'broadcastTime': instance.broadcastTime,
      'id': instance.id,
      'type': _$TxTypeEnumMap[instance.type]!,
      'timestamp': instance.timestamp,
      'amount': instance.amount,
      'fee': instance.fee,
      'height': instance.height,
      'rbfEnabled': instance.rbfEnabled,
      'version': instance.version,
      'vsize': instance.vsize,
      'weight': instance.weight,
      'locktime': instance.locktime,
      'inputs': instance.inputs,
      'outputs': instance.outputs,
      'toAddress': instance.toAddress,
      'labels': instance.labels,
      'walletId': instance.walletId,
    };

const _$TxTypeEnumMap = {
  TxType.Bitcoin: 'Bitcoin',
  TxType.Liquid: 'Liquid',
  TxType.Lightning: 'Lightning',
  TxType.Usdt: 'Usdt',
};

_$BitcoinOutPointImpl _$$BitcoinOutPointImplFromJson(
        Map<String, dynamic> json) =>
    _$BitcoinOutPointImpl(
      txid: json['txid'] as String,
      vout: json['vout'] as int,
    );

Map<String, dynamic> _$$BitcoinOutPointImplToJson(
        _$BitcoinOutPointImpl instance) =>
    <String, dynamic>{
      'txid': instance.txid,
      'vout': instance.vout,
    };

_$BitcoinTxInImpl _$$BitcoinTxInImplFromJson(Map<String, dynamic> json) =>
    _$BitcoinTxInImpl(
      previousOutput: BitcoinOutPoint.fromJson(
          json['previousOutput'] as Map<String, dynamic>),
      scriptSig: json['scriptSig'] as String,
      sequence: json['sequence'] as int,
      witness:
          (json['witness'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$BitcoinTxInImplToJson(_$BitcoinTxInImpl instance) =>
    <String, dynamic>{
      'previousOutput': instance.previousOutput,
      'scriptSig': instance.scriptSig,
      'sequence': instance.sequence,
      'witness': instance.witness,
    };

_$BitcoinTxOutImpl _$$BitcoinTxOutImplFromJson(Map<String, dynamic> json) =>
    _$BitcoinTxOutImpl(
      value: json['value'] as int,
      scriptPubKey: json['scriptPubKey'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$BitcoinTxOutImplToJson(_$BitcoinTxOutImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'scriptPubKey': instance.scriptPubKey,
      'address': instance.address,
    };
