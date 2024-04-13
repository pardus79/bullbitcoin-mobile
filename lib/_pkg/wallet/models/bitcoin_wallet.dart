// ignore_for_file: avoid_print, invalid_annotation_target

import 'dart:convert';

import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/constants.dart';
import 'package:bb_arch/_pkg/err.dart';
import 'package:bb_arch/_pkg/seed/models/seed.dart';
import 'package:bb_arch/_pkg/tx/models/bitcoin_tx.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:crypto/crypto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bdk_flutter/bdk_flutter.dart' as bdk;
import 'package:path_provider/path_provider.dart';
import 'wallet.dart';

part 'bitcoin_wallet.freezed.dart';
part 'bitcoin_wallet.g.dart';

extension NetworkTypeExtension on NetworkType {
  bdk.Network get getBdkType {
    switch (this) {
      case NetworkType.Mainnet:
        return bdk.Network.Bitcoin;
      case NetworkType.Testnet:
        return bdk.Network.Testnet;
      case NetworkType.Signet:
        return bdk.Network.Signet;
    }
  }
}

@freezed
class BitcoinWallet extends Wallet with _$BitcoinWallet {
  factory BitcoinWallet({
    required String id,
    required String name,
    required int balance,
    required WalletType type,
    required NetworkType network,
    @Default(false) bool backupTested,
    DateTime? lastSync,
    DateTime? lastBackupTested,
    @Default('') String mnemonic,
    @Default('') String fingerprint,
    @JsonKey(includeFromJson: false, includeToJson: false) bdk.Blockchain? bdkBlockchain,
    @JsonKey(includeFromJson: false, includeToJson: false) bdk.Wallet? bdkWallet,
    @JsonKey(includeFromJson: false, includeToJson: false) bdk.Wallet? bdkSigningWallet,
  }) = _BitcoinWallet;
  BitcoinWallet._();

  factory BitcoinWallet.fromJson(Map<String, dynamic> json) => _$BitcoinWalletFromJson(json);

  static Future<Wallet> setupNewWallet(String mnemonicStr, NetworkType network, {String name = 'Wallet'}) async {
    return BitcoinWallet(
        id: name, name: name, balance: 0, type: WalletType.Bitcoin, network: network, mnemonic: mnemonicStr);
  }

  static Future<List<BitcoinWallet>> deriveFromSeed(Seed seed) async {
    final bdkMnemonic = await bdk.Mnemonic.fromString(seed.mnemonic);
    final bdkNetwork = seed.network == NetworkType.Testnet ? bdk.Network.Testnet : bdk.Network.Bitcoin;
    final appDocDir = await getApplicationDocumentsDirectory();

    final bdkBlockchain = await bdk.Blockchain.create(
        config: const bdk.BlockchainConfig.electrum(
            config: bdk.ElectrumConfig(stopGap: 10, timeout: 5, retry: 5, url: btcElectrumUrl, validateDomain: true)));

    final rootXprv = await bdk.DescriptorSecretKey.create(
      network: bdkNetwork,
      mnemonic: bdkMnemonic,
      password: seed.passphrase,
    );
    final (mnemonicFingerprint, _) = await getFingerprint(
      mnemonic: seed.mnemonic,
      passphrase: '',
    );
    final (sourceFingerprint, _) = await getFingerprint(
      mnemonic: seed.mnemonic,
      passphrase: seed.passphrase,
    );

    final networkPath = seed.network == NetworkType.Mainnet ? '0h' : '1h';
    const accountPath = '0h';

    final bdkXpriv44 = await rootXprv.derive(
      await bdk.DerivationPath.create(path: 'm/44h/$networkPath/$accountPath'),
    );
    final bdkXpriv49 = await rootXprv.derive(
      await bdk.DerivationPath.create(path: 'm/49h/$networkPath/$accountPath'),
    );
    final bdkXpriv84 = await rootXprv.derive(
      await bdk.DerivationPath.create(path: 'm/84h/$networkPath/$accountPath'),
    );

    final bdkXpub44 = await bdkXpriv44.asPublic();
    final bdkXpub49 = await bdkXpriv49.asPublic();
    final bdkXpub84 = await bdkXpriv84.asPublic();

    final bdkDescriptor44External = await bdk.Descriptor.newBip44Public(
      publicKey: bdkXpub44,
      fingerPrint: sourceFingerprint!,
      network: bdkNetwork,
      keychain: bdk.KeychainKind.External,
    );
    final bdkDescriptor44Internal = await bdk.Descriptor.newBip44Public(
      publicKey: bdkXpub44,
      fingerPrint: sourceFingerprint,
      network: bdkNetwork,
      keychain: bdk.KeychainKind.Internal,
    );
    final bdkDescriptor49External = await bdk.Descriptor.newBip49Public(
      publicKey: bdkXpub49,
      fingerPrint: sourceFingerprint,
      network: bdkNetwork,
      keychain: bdk.KeychainKind.External,
    );
    final bdkDescriptor49Internal = await bdk.Descriptor.newBip49Public(
      publicKey: bdkXpub49,
      fingerPrint: sourceFingerprint,
      network: bdkNetwork,
      keychain: bdk.KeychainKind.Internal,
    );
    final bdkDescriptor84External = await bdk.Descriptor.newBip84Public(
      publicKey: bdkXpub84,
      fingerPrint: sourceFingerprint,
      network: bdkNetwork,
      keychain: bdk.KeychainKind.External,
    );
    final bdkDescriptor84Internal = await bdk.Descriptor.newBip84Public(
      publicKey: bdkXpub84,
      fingerPrint: sourceFingerprint,
      network: bdkNetwork,
      keychain: bdk.KeychainKind.Internal,
    );

    final external44 = await bdk.Descriptor.create(
      descriptor: await bdkDescriptor44External.asString(),
      network: bdkNetwork,
    );
    final internal44 = await bdk.Descriptor.create(
      descriptor: await bdkDescriptor44Internal.asString(),
      network: bdkNetwork,
    );

    final wallet44HashId = createDescriptorHashId(await bdkDescriptor44External.asString()).substring(0, 12);
    final String dbDir44 = '${appDocDir.path}/$wallet44HashId';
    final dbConfig44 = bdk.DatabaseConfig.sqlite(
      config: bdk.SqliteDbConfiguration(path: dbDir44),
    );

    final bdkWallet44 = await bdk.Wallet.create(
      descriptor: external44,
      changeDescriptor: internal44,
      network: bdkNetwork,
      databaseConfig: dbConfig44,
    );

    BitcoinWallet w44 = await setupNewWallet('', seed.network) as BitcoinWallet;
    w44 = w44.copyWith(
        id: wallet44HashId, bdkWallet: bdkWallet44, bdkBlockchain: bdkBlockchain, fingerprint: sourceFingerprint);

    final external49 = await bdk.Descriptor.create(
      descriptor: await bdkDescriptor49External.asString(),
      network: bdkNetwork,
    );
    final internal49 = await bdk.Descriptor.create(
      descriptor: await bdkDescriptor49Internal.asString(),
      network: bdkNetwork,
    );

    final wallet49HashId = createDescriptorHashId(await bdkDescriptor49External.asString()).substring(0, 12);
    final String dbDir49 = '${appDocDir.path}/$wallet49HashId';
    final dbConfig49 = bdk.DatabaseConfig.sqlite(
      config: bdk.SqliteDbConfiguration(path: dbDir49),
    );

    final bdkWallet49 = await bdk.Wallet.create(
      descriptor: external49,
      changeDescriptor: internal49,
      network: bdkNetwork,
      databaseConfig: dbConfig49,
    );

    BitcoinWallet w49 = await setupNewWallet('', seed.network) as BitcoinWallet;
    w49 = w49.copyWith(
        id: wallet49HashId, bdkWallet: bdkWallet49, bdkBlockchain: bdkBlockchain, fingerprint: sourceFingerprint);

    final external84 = await bdk.Descriptor.create(
      descriptor: await bdkDescriptor84External.asString(),
      network: bdkNetwork,
    );
    final internal84 = await bdk.Descriptor.create(
      descriptor: await bdkDescriptor84Internal.asString(),
      network: bdkNetwork,
    );

    final wallet84HashId = createDescriptorHashId(await bdkDescriptor84External.asString()).substring(0, 12);
    final String dbDir84 = '${appDocDir.path}/$wallet84HashId';
    final dbConfig84 = bdk.DatabaseConfig.sqlite(
      config: bdk.SqliteDbConfiguration(path: dbDir84),
    );

    final bdkWallet84 = await bdk.Wallet.create(
      descriptor: external84,
      changeDescriptor: internal84,
      network: bdkNetwork,
      databaseConfig: dbConfig84,
    );

    BitcoinWallet w84 = await setupNewWallet('', seed.network) as BitcoinWallet;
    w84 = w84.copyWith(
        id: wallet84HashId, bdkWallet: bdkWallet84, bdkBlockchain: bdkBlockchain, fingerprint: sourceFingerprint);

    return [w44, w49, w84];
  }

  static Future<BitcoinWallet> loadNativeSdk(BitcoinWallet w) async {
    print('Loading native sdk for bitcoin wallet');

    final mnem = await bdk.Mnemonic.fromString(w.mnemonic);

    final descriptorSecretKey = await bdk.DescriptorSecretKey.create(network: bdk.Network.Testnet, mnemonic: mnem);

    final externalDescriptor = await bdk.Descriptor.newBip84(
        secretKey: descriptorSecretKey, network: bdk.Network.Testnet, keychain: bdk.KeychainKind.External);
    final internalDescriptor = await bdk.Descriptor.newBip84(
        secretKey: descriptorSecretKey, network: bdk.Network.Testnet, keychain: bdk.KeychainKind.Internal);

    // TODO: Make this common across all wallets
    final bdkBlockchain = await bdk.Blockchain.create(
        config: const bdk.BlockchainConfig.electrum(
            config: bdk.ElectrumConfig(stopGap: 10, timeout: 5, retry: 5, url: btcElectrumUrl, validateDomain: true)));

    final wallet = await bdk.Wallet.create(
        descriptor: externalDescriptor,
        changeDescriptor: internalDescriptor,
        network: bdk.Network.Testnet,
        databaseConfig: const bdk.DatabaseConfig.memory());

    return w.copyWith(bdkWallet: wallet, bdkBlockchain: bdkBlockchain);
  }

  static Future<Wallet> syncWallet(BitcoinWallet w) async {
    print('Syncing via bdk');

    if (w.bdkWallet == null) {
      print('Wallet is not loaded with bdk. Loading it now');
      w = await loadNativeSdk(w);
    }

    await w.bdkWallet?.sync(w.bdkBlockchain!);

    final bal = await w.bdkWallet?.getBalance();
    final balance = bal?.confirmed ?? 0;
    print('balance is $balance');

    return w.copyWith(balance: balance, lastSync: DateTime.now());
  }

  @override
  Future<Iterable<Tx>> getTxs(WalletType type) async {
    final txs = await bdkWallet?.listTransactions(true);
    final txsFutures = txs?.map((t) => Tx.loadFromNative(t, this)) ?? [];

    return Future.wait(txsFutures);
  }

  @override
  Future<Address> getAddress(int index, AddressKind kind) async {
    bdk.AddressInfo? bdkAddress;

    if (kind == AddressKind.deposit) {
      bdkAddress = await bdkWallet?.getAddress(addressIndex: bdk.AddressIndex.peek(index: index));
    } else {
      bdkAddress = await bdkWallet?.getInternalAddress(addressIndex: bdk.AddressIndex.peek(index: index));
    }
    return Address.loadFromNative(bdkAddress, this, kind);
  }
}

Future<(String?, dynamic)> getFingerprint({
  required String mnemonic,
  String? passphrase,
}) async {
  try {
    final mn = await bdk.Mnemonic.fromString(mnemonic);
    final descriptorSecretKey = await bdk.DescriptorSecretKey.create(
      network: bdk.Network.Bitcoin,
      mnemonic: mn,
      password: passphrase,
    );

    final externalDescriptor = await bdk.Descriptor.newBip84(
      secretKey: descriptorSecretKey,
      network: bdk.Network.Bitcoin,
      keychain: bdk.KeychainKind.External,
    );
    final edesc = await externalDescriptor.asString();
    final fgnr = fingerPrintFromXKeyDesc(edesc);

    return (fgnr, null);
  } on Exception catch (e) {
    return (null, e);
  }
}

String fingerPrintFromXKeyDesc(
  String xkey,
) {
  final startIndex = xkey.indexOf('[');
  if (startIndex == -1) return 'Unknown';
  final fingerPrintEndIndex = xkey.indexOf('/');
  final fingerPrint = xkey.substring(startIndex + 1, fingerPrintEndIndex);
  return fingerPrint;
}

String createDescriptorHashId(String descriptor) {
  final descHashId = sha1
      .convert(
        utf8.encode(
          descriptor.replaceFirst('/0/*', '/<0;1>/*').replaceFirst('/1/*', '/<0;1>/*'),
        ),
      )
      .toString()
      .substring(0, 12);
  return descHashId;
}
