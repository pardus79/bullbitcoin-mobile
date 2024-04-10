// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeedImpl _$$SeedImplFromJson(Map<String, dynamic> json) => _$SeedImpl(
      mnemonic: json['mnemonic'] as String,
      mnemonicFingerprint: json['mnemonicFingerprint'] as String,
      walletType: $enumDecode(_$WalletTypeEnumMap, json['walletType']),
      network: $enumDecode(_$NetworkTypeEnumMap, json['network']),
      passphrase: json['passphrase'] as String,
      derivationPath: json['derivationPath'] as String,
      hash: json['hash'] as String,
    );

Map<String, dynamic> _$$SeedImplToJson(_$SeedImpl instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'mnemonicFingerprint': instance.mnemonicFingerprint,
      'walletType': _$WalletTypeEnumMap[instance.walletType]!,
      'network': _$NetworkTypeEnumMap[instance.network]!,
      'passphrase': instance.passphrase,
      'derivationPath': instance.derivationPath,
      'hash': instance.hash,
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
