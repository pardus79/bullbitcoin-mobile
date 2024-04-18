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
      type: $enumDecode(_$WalletTypeEnumMap, json['type']),
      network: $enumDecode(_$NetworkTypeEnumMap, json['network']),
      seedFingerprint: json['seedFingerprint'] as String,
      bipPath:
          $enumDecodeNullable(_$BitcoinScriptTypeEnumMap, json['bipPath']) ??
              BitcoinScriptType.bip84,
      lastSync: json['lastSync'] == null
          ? null
          : DateTime.parse(json['lastSync'] as String),
      importType:
          $enumDecodeNullable(_$ImportTypesEnumMap, json['importType']) ??
              ImportTypes.words12,
    )
      ..isarId = json['isarId'] as int
      ..name = json['name'] as String
      ..txCount = json['txCount'] as int;

Map<String, dynamic> _$$LightningWalletImplToJson(
        _$LightningWalletImpl instance) =>
    <String, dynamic>{
      'isarId': instance.isarId,
      'name': instance.name,
      'txCount': instance.txCount,
      'id': instance.id,
      'balance': instance.balance,
      'backupTested': instance.backupTested,
      'lastBackupTested': instance.lastBackupTested?.toIso8601String(),
      'type': _$WalletTypeEnumMap[instance.type]!,
      'network': _$NetworkTypeEnumMap[instance.network]!,
      'seedFingerprint': instance.seedFingerprint,
      'bipPath': _$BitcoinScriptTypeEnumMap[instance.bipPath]!,
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
