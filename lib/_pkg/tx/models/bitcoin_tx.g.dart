// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitcoin_tx.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BitcoinTxImpl _$$BitcoinTxImplFromJson(Map<String, dynamic> json) =>
    _$BitcoinTxImpl(
      id: json['id'] as String,
      amount: json['amount'] as int,
      fee: json['fee'] as int,
      timestamp: json['timestamp'] as int,
      type: $enumDecode(_$TxTypeEnumMap, json['type']),
    )
      ..received = json['received'] as int?
      ..sent = json['sent'] as int?
      ..height = json['height'] as int?
      ..label = json['label'] as String?
      ..toAddress = json['toAddress'] as String?
      ..psbt = json['psbt'] as String?
      ..broadcastTime = json['broadcastTime'] as int?
      ..rbfEnabled = json['rbfEnabled'] as bool?;

Map<String, dynamic> _$$BitcoinTxImplToJson(_$BitcoinTxImpl instance) =>
    <String, dynamic>{
      'received': instance.received,
      'sent': instance.sent,
      'height': instance.height,
      'label': instance.label,
      'toAddress': instance.toAddress,
      'psbt': instance.psbt,
      'broadcastTime': instance.broadcastTime,
      'rbfEnabled': instance.rbfEnabled,
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
