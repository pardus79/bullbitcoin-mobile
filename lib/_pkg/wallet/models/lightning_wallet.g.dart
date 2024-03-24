// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lightning_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LightningWalletImpl _$$LightningWalletImplFromJson(
        Map<String, dynamic> json) =>
    _$LightningWalletImpl(
      id: json['id'] as String,
      balance: json['balance'] as int,
      backupTested: json['backupTested'] as bool? ?? false,
      lastBackupTested: json['lastBackupTested'] == null
          ? null
          : DateTime.parse(json['lastBackupTested'] as String),
    )
      ..name = json['name'] as String
      ..type = $enumDecode(_$WalletTypeEnumMap, json['type'])
      ..network = $enumDecode(_$NetworkTypeEnumMap, json['network'])
      ..lastSync = json['lastSync'] == null
          ? null
          : DateTime.parse(json['lastSync'] as String)
      ..mnemonic = json['mnemonic'] as String
      ..bdkWallet = json['bdkWallet']
      ..bdkBlockchain = json['bdkBlockchain']
      ..lwkWallet = json['lwkWallet'];

Map<String, dynamic> _$$LightningWalletImplToJson(
        _$LightningWalletImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$WalletTypeEnumMap[instance.type]!,
      'network': _$NetworkTypeEnumMap[instance.network]!,
      'lastSync': instance.lastSync?.toIso8601String(),
      'mnemonic': instance.mnemonic,
      'bdkWallet': instance.bdkWallet,
      'bdkBlockchain': instance.bdkBlockchain,
      'lwkWallet': instance.lwkWallet,
      'id': instance.id,
      'balance': instance.balance,
      'backupTested': instance.backupTested,
      'lastBackupTested': instance.lastBackupTested?.toIso8601String(),
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
