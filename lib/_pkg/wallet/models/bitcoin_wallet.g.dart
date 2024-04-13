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
      fingerprint: json['fingerprint'] as String? ?? '',
      importType:
          $enumDecodeNullable(_$ImportTypesEnumMap, json['importType']) ??
              ImportTypes.words12,
    )..mnemonic = json['mnemonic'] as String;

Map<String, dynamic> _$$BitcoinWalletImplToJson(_$BitcoinWalletImpl instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'type': _$WalletTypeEnumMap[instance.type]!,
      'network': _$NetworkTypeEnumMap[instance.network]!,
      'backupTested': instance.backupTested,
      'lastSync': instance.lastSync?.toIso8601String(),
      'lastBackupTested': instance.lastBackupTested?.toIso8601String(),
      'fingerprint': instance.fingerprint,
      'importType': _$ImportTypesEnumMap[instance.importType]!,
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

const _$ImportTypesEnumMap = {
  ImportTypes.xpub: 'xpub',
  ImportTypes.coldcard: 'coldcard',
  ImportTypes.words12: 'words12',
  ImportTypes.words24: 'words24',
  ImportTypes.notSelected: 'notSelected',
};
