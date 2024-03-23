import 'dart:convert';
import 'dart:ffi';

import 'package:bb_arch/_pkg/storage/hive.dart';
import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';

class WalletRepository {
  WalletRepository({required this.storage}) {
    initOnAppStart();
  }

  HiveStorage storage;

  late List<Wallet> wallets;

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

      wallets = walletsJson.map((walletJson) => BitcoinWallet.fromJson(walletJson as Map<String, dynamic>)).toList();

      return (wallets, null);
    } catch (e) {
      return (null, e);
    }
  }

  Future<void> setupWallets() async {
    Wallet w1Bitcoin = await BitcoinWallet.loadFromMnemonic(
        'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial');
    w1Bitcoin.id = 'Vegeta Testnet';
    List<Wallet> wallets = [w1Bitcoin];

    List<Map<String, dynamic>> walletsJson = wallets.map((wallet) => wallet.toJson()).toList();
    String encoded = jsonEncode(walletsJson);
    await storage.saveValue(key: 'wallets', value: encoded);
    print('Setting up wallets');
    // throw UnimplementedError();
  }
}
