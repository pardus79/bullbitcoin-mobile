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
      seedFingerprint: json['seedFingerprint'] as String,
      bipPath:
          $enumDecodeNullable(_$BitcoinScriptTypeEnumMap, json['bipPath']) ??
              BitcoinScriptType.bip84,
      importType:
          $enumDecodeNullable(_$ImportTypesEnumMap, json['importType']) ??
              ImportTypes.words12,
    )..isarid = json['isarid'] as int;

Map<String, dynamic> _$$LiquidWalletImplToJson(_$LiquidWalletImpl instance) =>
    <String, dynamic>{
      'isarid': instance.isarid,
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'type': _$WalletTypeEnumMap[instance.type]!,
      'network': _$NetworkTypeEnumMap[instance.network]!,
      'backupTested': instance.backupTested,
      'lastSync': instance.lastSync?.toIso8601String(),
      'lastBackupTested': instance.lastBackupTested?.toIso8601String(),
      'mnemonic': instance.mnemonic,
      'seedFingerprint': instance.seedFingerprint,
      'bipPath': _$BitcoinScriptTypeEnumMap[instance.bipPath]!,
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
