// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liquid_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiquidAddressImpl _$$LiquidAddressImplFromJson(Map<String, dynamic> json) =>
    _$LiquidAddressImpl(
      address: json['address'] as String,
      confidentialAddress: json['confidentialAddress'] as String,
      index: json['index'] as int,
      kind: $enumDecode(_$AddressKindEnumMap, json['kind']),
      status: $enumDecode(_$AddressStatusEnumMap, json['status']),
      type: $enumDecode(_$AddressTypeEnumMap, json['type']),
      balance: json['balance'] as int? ?? 0,
      spendable: json['spendable'] as bool? ?? true,
      labels: (json['labels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      txCount: json['txCount'] as int? ?? 0,
      txIds:
          (json['txIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      walletId: json['walletId'] as String?,
    )..state = $enumDecode(_$AddressStatusEnumMap, json['state']);

Map<String, dynamic> _$$LiquidAddressImplToJson(_$LiquidAddressImpl instance) =>
    <String, dynamic>{
      'state': _$AddressStatusEnumMap[instance.state]!,
      'address': instance.address,
      'confidentialAddress': instance.confidentialAddress,
      'index': instance.index,
      'kind': _$AddressKindEnumMap[instance.kind]!,
      'status': _$AddressStatusEnumMap[instance.status]!,
      'type': _$AddressTypeEnumMap[instance.type]!,
      'balance': instance.balance,
      'spendable': instance.spendable,
      'labels': instance.labels,
      'txCount': instance.txCount,
      'txIds': instance.txIds,
      'walletId': instance.walletId,
    };

const _$AddressKindEnumMap = {
  AddressKind.deposit: 'deposit',
  AddressKind.change: 'change',
  AddressKind.external: 'external',
};

const _$AddressStatusEnumMap = {
  AddressStatus.unused: 'unused',
  AddressStatus.active: 'active',
  AddressStatus.used: 'used',
  AddressStatus.copied: 'copied',
};

const _$AddressTypeEnumMap = {
  AddressType.Bitcoin: 'Bitcoin',
  AddressType.Liquid: 'Liquid',
  AddressType.Lightning: 'Lightning',
  AddressType.Usdt: 'Usdt',
};
