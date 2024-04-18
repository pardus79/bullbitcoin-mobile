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
      txCount: json['txCount'] as int,
      type: $enumDecode(_$WalletTypeEnumMap, json['type']),
      network: $enumDecode(_$NetworkTypeEnumMap, json['network']),
      seedFingerprint: json['seedFingerprint'] as String,
      bipPath:
          $enumDecodeNullable(_$BitcoinScriptTypeEnumMap, json['bipPath']) ??
              BitcoinScriptType.bip84,
      backupTested: json['backupTested'] as bool? ?? false,
      lastBackupTested: json['lastBackupTested'] == null
          ? null
          : DateTime.parse(json['lastBackupTested'] as String),
      lastSync: json['lastSync'] == null
          ? null
          : DateTime.parse(json['lastSync'] as String),
      importType:
          $enumDecodeNullable(_$ImportTypesEnumMap, json['importType']) ??
              ImportTypes.words12,
    )..isarId = json['isarId'] as int;

Map<String, dynamic> _$$BitcoinWalletImplToJson(_$BitcoinWalletImpl instance) =>
    <String, dynamic>{
      'isarId': instance.isarId,
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'txCount': instance.txCount,
      'type': _$WalletTypeEnumMap[instance.type]!,
      'network': _$NetworkTypeEnumMap[instance.network]!,
      'seedFingerprint': instance.seedFingerprint,
      'bipPath': _$BitcoinScriptTypeEnumMap[instance.bipPath]!,
      'backupTested': instance.backupTested,
      'lastBackupTested': instance.lastBackupTested?.toIso8601String(),
      'lastSync': instance.lastSync?.toIso8601String(),
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

const _$BitcoinScriptTypeEnumMap = {
  BitcoinScriptType.bip86: 'bip86',
  BitcoinScriptType.bip84: 'bip84',
  BitcoinScriptType.bip49: 'bip49',
  BitcoinScriptType.bip44: 'bip44',
};

const _$ImportTypesEnumMap = {
  ImportTypes.xpub: 'xpub',
  ImportTypes.coldcard: 'coldcard',
  ImportTypes.descriptors: 'descriptors',
  ImportTypes.words12: 'words12',
  ImportTypes.words24: 'words24',
  ImportTypes.notSelected: 'notSelected',
};
