// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bb_arch/_pkg/seed/models/seed.dart';
import 'package:bb_arch/_pkg/storage/hive.dart';
import 'package:bb_arch/_pkg/wallet/bitcoin_wallet_helper.dart';
import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/liquid_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/wallet/bloc/wallet_state.dart';

class WalletRepository {
  WalletRepository({required this.storage}) {
    // initOnAppStart();
  }

  HiveStorage storage;

  Future<void> initOnAppStart() async {
    print('Init on app start');
    try {
      final (_, err) = await storage.getValue('appInitDone');
      if (err?.message == 'No Key') {
        await setupWallets();
        await storage.saveValue(key: 'appInitDone', value: 'yes');
      }
    } catch (e) {
      return;
    }
  }

  Future<(List<Wallet>?, dynamic)> loadWallets() async {
    try {
      final (walletsStr, _) = await storage.getValue('wallets');
      if (walletsStr == null) {
        // TODO: Dumb. Without this, bloc's LoadStatus.Success emit it not happening!
        await Future.delayed(const Duration(milliseconds: 100));
        List<Wallet> wallets = [];
        return (wallets, null);
      }
      List<dynamic> walletsJson = jsonDecode(walletsStr);
      final wallets = walletsJson.map((walletJson) => Wallet.fromJson(walletJson)).toList();

      return (wallets, null);
    } catch (e) {
      return (null, e);
    }
  }

  void addWallet(Wallet w) {
    throw UnimplementedError();
  }

  Future<void> persistWallets(List<Wallet> wallets) async {
    List<Map<String, dynamic>> walletsJson = wallets.map((wallet) => wallet.toJson()).toList();
    String encoded = jsonEncode(walletsJson);
    await storage.saveValue(key: 'wallets', value: encoded);
  }

  Future<void> setupWallets() async {
    print('Setting up wallets: BEGIN');
    Wallet w1Bitcoin = await BitcoinWallet.setupNewWallet(
        'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial', NetworkType.Testnet,
        name: 'VegetaTestnet');

    Wallet w2Liquid = await LiquidWallet.setupNewWallet(
        'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial', NetworkType.Testnet,
        name: 'LiquidVegetaTestnet');

    Wallet w3Bitcoin = await BitcoinWallet.setupNewWallet(
        'lumber tackle notice city expand cherry tonight people blue cactus forward scissors', NetworkType.Testnet,
        name: 'NarutoTestnet');

    Wallet w4Bitcoin = await BitcoinWallet.setupNewWallet(
        'rookie urban exchange kit unfold memory assist blast access captain evolve happy', NetworkType.Testnet,
        name: 'bdkTestTestnet');

    List<Wallet> wallets = [w1Bitcoin, w2Liquid, w3Bitcoin, w4Bitcoin];

    List<Map<String, dynamic>> walletsJson = wallets.map((wallet) => wallet.toJson()).toList();
    String encoded = jsonEncode(walletsJson);
    await storage.saveValue(key: 'wallets', value: encoded);
    print('Setting up wallets: DONE');
  }

  Future<(List<Wallet>?, dynamic)> deriveWalletsFromSeed(Seed seed) async {
    final ws = await BitcoinWalletHelper.initializeAllWallets(seed);
    return (ws, null);
  }
}
