// ignore_for_file: avoid_print, invalid_annotation_target

import 'dart:convert';

import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/constants.dart';
import 'package:bb_arch/_pkg/err.dart';
import 'package:bb_arch/_pkg/seed/models/seed.dart';
import 'package:bb_arch/_pkg/seed/seed_repository.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:crypto/crypto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bdk_flutter/bdk_flutter.dart' as bdk;
import 'package:path_provider/path_provider.dart';
import 'wallet.dart';

part 'bitcoin_wallet.freezed.dart';
part 'bitcoin_wallet.g.dart';

enum ImportTypes { xpub, coldcard, words12, words24, notSelected }

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
    required String seedFingerprint,
    @Default('84h') String bipPath,
    @Default(false) bool backupTested,
    DateTime? lastSync,
    DateTime? lastBackupTested,
    @Default(ImportTypes.words12) ImportTypes importType,
    @JsonKey(includeFromJson: false, includeToJson: false) bdk.Blockchain? bdkBlockchain,
    @JsonKey(includeFromJson: false, includeToJson: false) bdk.Wallet? bdkWallet,
    @JsonKey(includeFromJson: false, includeToJson: false) bdk.Wallet? bdkSigningWallet,
  }) = _BitcoinWallet;
  BitcoinWallet._();

  factory BitcoinWallet.fromJson(Map<String, dynamic> json) => _$BitcoinWalletFromJson(json);

  static Future<Wallet> setupNewWallet(String mnemonicStr, NetworkType network, {String name = 'Wallet'}) async {
    return BitcoinWallet(
        id: name, name: name, balance: 0, type: WalletType.Bitcoin, network: network, seedFingerprint: '');
  }

  static Future<BitcoinWallet> setupNewWallet2(String walletId, bdk.Wallet bdkWallet, bdk.Blockchain bdkBlockchain,
      String fingerprint, NetworkType network, ImportTypes importType, String bipPath,
      {String name = 'Wallet'}) async {
    BitcoinWallet wallet = BitcoinWallet(
        id: walletId,
        name: name,
        balance: 0,
        type: WalletType.Bitcoin,
        network: network,
        importType: importType,
        seedFingerprint: fingerprint,
        bipPath: bipPath);
    return wallet.copyWith(bdkWallet: bdkWallet, bdkBlockchain: bdkBlockchain);
  }

  static Future<List<BitcoinWallet>> deriveFromSeed(Seed seed,
      {List<String> bipPath = const ['44h', '49h', '84h']}) async {
    final bdkMnemonic = await bdk.Mnemonic.fromString(seed.mnemonic);
    final bdkNetwork = seed.network == NetworkType.Testnet ? bdk.Network.Testnet : bdk.Network.Bitcoin;
    final appDocDir = await getApplicationDocumentsDirectory();

    final bdkBlockchain = await initializeBlockchain();

    final rootXprv = await bdk.DescriptorSecretKey.create(
      network: bdkNetwork,
      mnemonic: bdkMnemonic,
      password: seed.passphrase,
    );
    final (sourceFingerprint, _) = await getFingerprint(mnemonic: seed.mnemonic, passphrase: seed.passphrase);

    final walletFutures = bipPath.map((path) =>
        initializeWallet(seed.network, bdkNetwork, path, rootXprv, sourceFingerprint!, appDocDir.path, bdkBlockchain));

    final wallets = await Future.wait(walletFutures);

    return wallets;
  }

  static Future<BitcoinWallet> loadNativeSdk(BitcoinWallet w, Seed seed) async {
    print('Loading native sdk for bitcoin wallet');

    if (w.importType == ImportTypes.words12) {
      print('derive');
      BitcoinWallet loadedWallet = (await BitcoinWallet.deriveFromSeed(seed, bipPath: [w.bipPath])).first;
      return w.copyWith(bdkBlockchain: loadedWallet.bdkBlockchain, bdkWallet: loadedWallet.bdkWallet);
    }

    return BitcoinWallet(
        id: 'id',
        name: 'name',
        balance: 0,
        type: WalletType.Bitcoin,
        network: NetworkType.Testnet,
        seedFingerprint: '');

    // final mnem = await bdk.Mnemonic.fromString(w.mnemonic);

    // final descriptorSecretKey = await bdk.DescriptorSecretKey.create(network: bdk.Network.Testnet, mnemonic: mnem);

    // final externalDescriptor = await bdk.Descriptor.newBip84(
    //     secretKey: descriptorSecretKey, network: bdk.Network.Testnet, keychain: bdk.KeychainKind.External);
    // final internalDescriptor = await bdk.Descriptor.newBip84(
    //     secretKey: descriptorSecretKey, network: bdk.Network.Testnet, keychain: bdk.KeychainKind.Internal);

    // // TODO: Make this common across all wallets
    // final bdkBlockchain = await bdk.Blockchain.create(
    //     config: const bdk.BlockchainConfig.electrum(
    //         config: bdk.ElectrumConfig(stopGap: 10, timeout: 5, retry: 5, url: btcElectrumUrl, validateDomain: true)));

    // final wallet = await bdk.Wallet.create(
    //     descriptor: externalDescriptor,
    //     changeDescriptor: internalDescriptor,
    //     network: bdk.Network.Testnet,
    //     databaseConfig: const bdk.DatabaseConfig.memory());

    // return w.copyWith(bdkWallet: wallet, bdkBlockchain: bdkBlockchain);
  }

  static Future<Wallet> syncWallet(BitcoinWallet w) async {
    print('Syncing via bdk');

    // if (w.bdkWallet == null) {
    //   print('Wallet is not loaded with bdk. Loading it now');
    //   w = await loadNativeSdkFromMnemonic(w);
    // }

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

Future<bdk.Blockchain> initializeBlockchain() async {
  return await bdk.Blockchain.create(
      config: const bdk.BlockchainConfig.electrum(
          config: bdk.ElectrumConfig(stopGap: 10, timeout: 5, retry: 5, url: btcElectrumUrl, validateDomain: true)));
}

bdk.DatabaseConfig walletDbConfig(String path) {
  return bdk.DatabaseConfig.sqlite(
    config: bdk.SqliteDbConfiguration(path: path),
  );
}

Future<bdk.Descriptor> deriveDescriptor(String path, String bipPath, bdk.DescriptorSecretKey rootXprv,
    bdk.Network network, bdk.KeychainKind keychainKind, String sourceFingerprint) async {
  final xpriv = await rootXprv.derive(await bdk.DerivationPath.create(path: path));
  final xpub = await xpriv.asPublic();
  final descriptor = await (bipPath == '44h'
          ? bdk.Descriptor.newBip44Public
          : bipPath == '49h'
              ? bdk.Descriptor.newBip49Public
              : bdk.Descriptor.newBip84Public)(
      publicKey: xpub, fingerPrint: sourceFingerprint, network: network, keychain: keychainKind);
  return await bdk.Descriptor.create(descriptor: await descriptor.asString(), network: network);
}

Future<BitcoinWallet> initializeWallet(NetworkType bbnetwork, bdk.Network network, String bipPath,
    bdk.DescriptorSecretKey rootXprv, String sourceFingerprint, String appDocDirPath, bdk.Blockchain blockchain) async {
  final networkPath = network == bdk.Network.Bitcoin ? '0h' : '1h';
  const accountPath = '0h';
  final fullPath = 'm/$bipPath/$networkPath/$accountPath';
  final externalDescriptor =
      await deriveDescriptor(fullPath, bipPath, rootXprv, network, bdk.KeychainKind.External, sourceFingerprint);
  final internalDescriptor =
      await deriveDescriptor(fullPath, bipPath, rootXprv, network, bdk.KeychainKind.Internal, sourceFingerprint);
  final walletHashId = createDescriptorHashId(await externalDescriptor.asString()).substring(0, 12);
  final dbDir = '$appDocDirPath/$walletHashId';
  final dbConfig = walletDbConfig(dbDir);
  final bdkPublicWallet = await bdk.Wallet.create(
      descriptor: externalDescriptor, changeDescriptor: internalDescriptor, network: network, databaseConfig: dbConfig);

  return BitcoinWallet.setupNewWallet2(
      walletHashId, bdkPublicWallet, blockchain, sourceFingerprint, bbnetwork, ImportTypes.words12, bipPath);
}
