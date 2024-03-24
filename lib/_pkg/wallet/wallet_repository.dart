// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:ffi';

import 'package:bb_arch/_pkg/storage/hive.dart';
import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/liquid_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';

class WalletRepository {
  WalletRepository({required this.storage}) {
    initOnAppStart();
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

  Future<(List<Wallet>?, dynamic)> readAllWallets() async {
    try {
      final (walletsStr, _) = await storage.getValue('wallets');

      List<dynamic> walletsJson = jsonDecode(walletsStr!);

      final wallets = walletsJson.map((walletJson) {
        // TODO: Generalize and move to Wallet
        if (walletJson['type'] == 'Bitcoin') {
          return BitcoinWallet.fromJson(walletJson as Map<String, dynamic>);
        } else if (walletJson['type'] == 'Liquid') {
          return LiquidWallet.fromJson(walletJson as Map<String, dynamic>);
        } else {
          throw UnimplementedError();
        }
      }).toList();

      return (wallets, null);
    } catch (e) {
      return (null, e);
    }
  }

  void addWallet(Wallet w) {}

  Future<void> setupWallets() async {
    print('Setting up wallets: BEGIN');
    Wallet w1Bitcoin = await BitcoinWallet.setupNewWallet(
        'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial', NetworkType.Testnet);
    w1Bitcoin.id = 'Vegeta Testnet';

    Wallet w2Liquid = await LiquidWallet.setupNewWallet(
        'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial', NetworkType.Testnet);
    w2Liquid.id = 'Liquid Vegeta Testnet';

    Wallet w3Bitcoin = await BitcoinWallet.setupNewWallet(
        'lumber tackle notice city expand cherry tonight people blue cactus forward scissors', NetworkType.Testnet);
    w3Bitcoin.id = 'Naruto Testnet';

    Wallet w4Bitcoin = await BitcoinWallet.setupNewWallet(
        'rookie urban exchange kit unfold memory assist blast access captain evolve happy', NetworkType.Testnet);
    w4Bitcoin.id = 'bdk test Testnet';

    List<Wallet> wallets = [w1Bitcoin, w2Liquid, w3Bitcoin, w4Bitcoin];

    List<Map<String, dynamic>> walletsJson = wallets.map((wallet) => wallet.toJson()).toList();
    String encoded = jsonEncode(walletsJson);
    await storage.saveValue(key: 'wallets', value: encoded);
    print('Setting up wallets: DONE');
    // throw UnimplementedError();
  }
}
