// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liquid_tx.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiquidTxImpl _$$LiquidTxImplFromJson(Map<String, dynamic> json) =>
    _$LiquidTxImpl(
      id: json['id'] as String,
      amount: json['amount'] as int,
      fee: json['fee'] as int,
      timestamp: json['timestamp'] as int,
      type: $enumDecode(_$TxTypeEnumMap, json['type']),
    )
      ..height = json['height'] as int?
      ..label = json['label'] as String?
      ..psbt = json['psbt'] as String?
      ..broadcastTime = json['broadcastTime'] as int?
      ..rbfEnabled = json['rbfEnabled'] as bool?
      ..version = json['version'] as int?
      ..vsize = json['vsize'] as int?
      ..weight = json['weight'] as int?
      ..toAddress = json['toAddress'] as String?
      ..walletId = json['walletId'] as String?;

Map<String, dynamic> _$$LiquidTxImplToJson(_$LiquidTxImpl instance) =>
    <String, dynamic>{
      'height': instance.height,
      'label': instance.label,
      'psbt': instance.psbt,
      'broadcastTime': instance.broadcastTime,
      'rbfEnabled': instance.rbfEnabled,
      'version': instance.version,
      'vsize': instance.vsize,
      'weight': instance.weight,
      'toAddress': instance.toAddress,
      'walletId': instance.walletId,
      'id': instance.id,
      'amount': instance.amount,
      'fee': instance.fee,
      'timestamp': instance.timestamp,
      'type': _$TxTypeEnumMap[instance.type]!,
    };

const _$TxTypeEnumMap = {
  TxType.Bitcoin: 'Bitcoin',
  TxType.Liquid: 'Liquid',
  TxType.Lightning: 'Lightning',
  TxType.Usdt: 'Usdt',
};
