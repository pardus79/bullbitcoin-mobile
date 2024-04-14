// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeedImpl _$$SeedImplFromJson(Map<String, dynamic> json) => _$SeedImpl(
      mnemonic: json['mnemonic'] as String,
      passphrase: json['passphrase'] as String,
      fingerprint: json['fingerprint'] as String,
      walletType: $enumDecode(_$WalletTypeEnumMap, json['walletType']),
      network: $enumDecode(_$NetworkTypeEnumMap, json['network']),
    );

Map<String, dynamic> _$$SeedImplToJson(_$SeedImpl instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'passphrase': instance.passphrase,
      'fingerprint': instance.fingerprint,
      'walletType': _$WalletTypeEnumMap[instance.walletType]!,
      'network': _$NetworkTypeEnumMap[instance.network]!,
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
