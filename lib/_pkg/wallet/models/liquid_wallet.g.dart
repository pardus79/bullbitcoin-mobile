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
      lastSync: json['lastSync'] == null
          ? null
          : DateTime.parse(json['lastSync'] as String),
      lastBackupTested: json['lastBackupTested'] == null
          ? null
          : DateTime.parse(json['lastBackupTested'] as String),
      mnemonic: json['mnemonic'] as String? ?? '',
    )
      ..seedFingerprint = json['seedFingerprint'] as String
      ..bipPath = $enumDecode(_$BitcoinScriptTypeEnumMap, json['bipPath']);

Map<String, dynamic> _$$LiquidWalletImplToJson(_$LiquidWalletImpl instance) =>
    <String, dynamic>{
      'seedFingerprint': instance.seedFingerprint,
      'bipPath': _$BitcoinScriptTypeEnumMap[instance.bipPath]!,
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'type': _$WalletTypeEnumMap[instance.type]!,
      'network': _$NetworkTypeEnumMap[instance.network]!,
      'backupTested': instance.backupTested,
      'lastSync': instance.lastSync?.toIso8601String(),
      'lastBackupTested': instance.lastBackupTested?.toIso8601String(),
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

const _$BitcoinScriptTypeEnumMap = {
  BitcoinScriptType.bip86: 'bip86',
  BitcoinScriptType.bip84: 'bip84',
  BitcoinScriptType.bip49: 'bip49',
  BitcoinScriptType.bip44: 'bip44',
};
