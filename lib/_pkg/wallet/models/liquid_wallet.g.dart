// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liquid_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiquidWalletImpl _$$LiquidWalletImplFromJson(Map<String, dynamic> json) =>
    _$LiquidWalletImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      balance: json['balance'] as int,
      type: $enumDecode(_$WalletTypeEnumMap, json['type']),
      network: $enumDecode(_$NetworkTypeEnumMap, json['network']),
      backupTested: json['backupTested'] as bool? ?? false,
      lastBackupTested: json['lastBackupTested'] == null
          ? null
          : DateTime.parse(json['lastBackupTested'] as String),
      electrumUrl: json['electrumUrl'] as String? ??
          'ssl://electrum.blockstream.info:60002',
      mnemonic: json['mnemonic'] as String? ?? '',
    )
      ..lastSync = json['lastSync'] == null
          ? null
          : DateTime.parse(json['lastSync'] as String)
      ..bdkWallet = json['bdkWallet']
      ..bdkBlockchain = json['bdkBlockchain'];

Map<String, dynamic> _$$LiquidWalletImplToJson(_$LiquidWalletImpl instance) =>
    <String, dynamic>{
      'lastSync': instance.lastSync?.toIso8601String(),
      'bdkWallet': instance.bdkWallet,
      'bdkBlockchain': instance.bdkBlockchain,
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'type': _$WalletTypeEnumMap[instance.type]!,
      'network': _$NetworkTypeEnumMap[instance.network]!,
      'backupTested': instance.backupTested,
      'lastBackupTested': instance.lastBackupTested?.toIso8601String(),
      'electrumUrl': instance.electrumUrl,
      'mnemonic': instance.mnemonic,
    };

const _$WalletTypeEnumMap = {
  WalletType.Bitcoin: 'Bitcoin',
  WalletType.Liquid: 'Liquid',
  WalletType.Lightning: 'Lightning',
  WalletType.Usdt: 'Usdt',
};

const _$NetworkTypeEnumMap = {
  NetworkType.Mainnet: 'Mainnet',
  NetworkType.Testnet: 'Testnet',
  NetworkType.Signet: 'Signet',
};
