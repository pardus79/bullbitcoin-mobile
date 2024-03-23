import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/liquid_wallet.dart';

enum WalletType { Bitcoin, Liquid, Lightning, Usdt }

extension WalletTypeExtension on WalletType {
  String get name {
    switch (this) {
      case WalletType.Bitcoin:
        return 'Bitcoin';
      case WalletType.Liquid:
        return 'Liquid';
      case WalletType.Lightning:
        return 'Lightning';
      case WalletType.Usdt:
        return 'Usdt';
    }
  }
}

enum NetworkType { Mainnet, Testnet, Signet }

extension NetworkTypeExtension on NetworkType {
  String get name {
    switch (this) {
      case NetworkType.Mainnet:
        return 'Mainnet';
      case NetworkType.Testnet:
        return 'Testnet';
      case NetworkType.Signet:
        return 'Signet';
    }
  }
}

abstract class Wallet {
  String id = '';
  int balance = 0;
  WalletType type = WalletType.Bitcoin;
  NetworkType network = NetworkType.Mainnet;
  bool backupTested = false;
  bool nativeSdkLoaded = false;
  DateTime? lastBackupTested;
  String electrumUrl = '';

  String mnemonic = '';

  get bdkWallet => null;

  get bdkBlockchain => null; // TODO: move this to safe place later

  static Future<Wallet> loadFromMnemonic(String mnemonic) {
    throw UnimplementedError();
  }

  static Future<Wallet> loadNativeSdk(Wallet wallet) {
    if (wallet.type == WalletType.Bitcoin) {
      return BitcoinWallet.loadNativeSdk(wallet as BitcoinWallet);
    }
    throw UnimplementedError('Unknown Wallet subclass');
  }

  static Future<Wallet> syncWallet(Wallet wallet) {
    if (wallet.type == WalletType.Bitcoin) {
      return BitcoinWallet.syncWallet(wallet as BitcoinWallet);
    }
    throw UnimplementedError('Unknown Wallet subclass');
  }

  WalletType getWalletType() {
    return type;
  }

  List<Map<String, dynamic>> getTransactions();
  Future<void> sync();

  Map<String, dynamic> toJson();

  static Wallet fromJson(Map<String, dynamic> json) {
    if (json.containsKey('type') && json['type'] == WalletType.Bitcoin) {
      return BitcoinWallet.fromJson(json);
    } else if (json.containsKey('type') && json['type'] == WalletType.Liquid) {
      return LiquidWallet.fromJson(json);
    }
    throw UnimplementedError('Unknown Wallet subclass');
  }
}
