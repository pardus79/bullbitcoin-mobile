// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitcoin_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BitcoinWalletImpl _$$BitcoinWalletImplFromJson(Map<String, dynamic> json) =>
    _$BitcoinWalletImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      balance: json['balance'] as int,
      type: $enumDecode(_$WalletTypeEnumMap, json['type']),
      network: $enumDecode(_$NetworkTypeEnumMap, json['network']),
      backupTested: json['backupTested'] as bool? ?? false,
      lastSync: json['lastSync'] == null
          ? null
          : DateTime.parse(json['lastSync'] as String),
      lastBackupTested: json['lastBackupTested'] == null
          ? null
          : DateTime.parse(json['lastBackupTested'] as String),
      mnemonic: json['mnemonic'] as String? ?? '',
      fingerprint: json['fingerprint'] as String? ?? '',
    );

Map<String, dynamic> _$$BitcoinWalletImplToJson(_$BitcoinWalletImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'type': _$WalletTypeEnumMap[instance.type]!,
      'network': _$NetworkTypeEnumMap[instance.network]!,
      'backupTested': instance.backupTested,
      'lastSync': instance.lastSync?.toIso8601String(),
      'lastBackupTested': instance.lastBackupTested?.toIso8601String(),
      'mnemonic': instance.mnemonic,
      'fingerprint': instance.fingerprint,
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
