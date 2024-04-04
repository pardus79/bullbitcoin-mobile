// ignore_for_file: avoid_print, invalid_annotation_target

import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/constants.dart';
import 'package:bb_arch/_pkg/tx/models/bitcoin_tx.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:json_annotation/json_annotation.dart';
import 'package:bdk_flutter/bdk_flutter.dart' as bdk;
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
    @JsonKey(includeFromJson: false, includeToJson: false) bdk.Blockchain? bdkBlockchain,
    @JsonKey(includeFromJson: false, includeToJson: false) bdk.Wallet? bdkWallet,
  }) = _BitcoinWallet;
  BitcoinWallet._();

  factory BitcoinWallet.fromJson(Map<String, dynamic> json) => _$BitcoinWalletFromJson(json);

  static Future<Wallet> setupNewWallet(String mnemonicStr, NetworkType network, {String name = 'Wallet'}) async {
    return BitcoinWallet(
        id: name, name: name, balance: 0, type: WalletType.Bitcoin, network: network, mnemonic: mnemonicStr);
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

  Future<Address> getAddress(int index) async {
    final bdkAddress = await bdkWallet?.getAddress(addressIndex: bdk.AddressIndex.peek(index: index));
    return Address.loadFromNative(bdkAddress, this);
  }
}
