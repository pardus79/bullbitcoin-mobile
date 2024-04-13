// ignore_for_file: avoid_print, invalid_annotation_target

import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'seed.freezed.dart';
part 'seed.g.dart';

@freezed
class Seed with _$Seed {
  const factory Seed({
    required String mnemonic,
    required String mnemonicFingerprint,
    required WalletType walletType,
    required NetworkType network,
    required String passphrase,
    required String derivationPath,
    required String hash,
    required String name,
  }) = _Seed;
  const Seed._();

  factory Seed.fromJson(Map<String, dynamic> json) => _$SeedFromJson(json);
}

/*
@freezed
class Passphrase with _$Passphrase {
  const factory Passphrase({
    @Default('') String passphrase,
    required String sourceFingerprint,
  }) = _Passphrase;
  const Passphrase._();

  factory Passphrase.fromJson(Map<String, dynamic> json) => _$PassphraseFromJson(json);
}
*/