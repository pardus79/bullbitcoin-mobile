// ignore_for_file: constant_identifier_names

import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/seed/models/seed.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/bitcoin_wallet_helper.dart';
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

enum BitcoinScriptType { bip86, bip84, bip49, bip44 }

extension BitcoinScriptTypeExtension on BitcoinScriptType {
  String get name {
    switch (this) {
      case BitcoinScriptType.bip44:
        return 'Legacy pubkey';
      case BitcoinScriptType.bip49:
        return 'Legacy script';
      case BitcoinScriptType.bip84:
        return 'Segwit';
      case BitcoinScriptType.bip86:
        return 'Taproot';
    }
  }

  String get path {
    switch (this) {
      case BitcoinScriptType.bip44:
        return '44h';
      case BitcoinScriptType.bip49:
        return '49h';
      case BitcoinScriptType.bip84:
        return '84h';
      case BitcoinScriptType.bip86:
        return '84h';
    }
  }
}

abstract class Wallet {
  String id = '';
  String name = '';
  int balance = 0;
  WalletType type = WalletType.Bitcoin;
  NetworkType network = NetworkType.Mainnet;
  String seedFingerprint = '';
  BitcoinScriptType bipPath = BitcoinScriptType.bip84;
  bool backupTested = false;
  DateTime? lastBackupTested;
  DateTime? lastSync;

  String mnemonic = ''; // TODO: Move to secure place

  static Wallet fromJson(Map<String, dynamic> json) {
    if (json.containsKey('type') && json['type'] == WalletType.Bitcoin.name) {
      return BitcoinWallet.fromJson(json);
    } else if (json.containsKey('type') && json['type'] == WalletType.Liquid.name) {
      return LiquidWallet.fromJson(json);
    }
    throw UnimplementedError('Unsupported Wallet subclass');
  }

  Map<String, dynamic> toJson();

  static Future<Wallet> setupNewWallet(WalletType type, String mnemonicStr, NetworkType network,
      {String name = 'Wallet'}) async {
    if (type == WalletType.Bitcoin) {
      return BitcoinWallet.setupNewWallet(mnemonicStr, network, name: name);
    } else if (type == WalletType.Liquid) {
      return LiquidWallet.setupNewWallet(mnemonicStr, network, name: name);
    }
    throw UnimplementedError('Unsupported Wallet subclass');
  }

  static Future<Wallet> loadNativeSdk(Wallet w, Seed seed) async {
    if (w.type == WalletType.Bitcoin) {
      return BitcoinWalletHelper.loadNativeSdk(w as BitcoinWallet, seed);
    } else if (w.type == WalletType.Liquid) {
      return LiquidWallet.loadNativeSdk(w as LiquidWallet);
    }
    throw UnimplementedError('Unsupported Wallet subclass');
  }

  static Future<Wallet> syncWallet(Wallet wallet) {
    if (wallet.type == WalletType.Bitcoin) {
      return BitcoinWalletHelper.syncWallet(wallet as BitcoinWallet);
    } else if (wallet.type == WalletType.Liquid) {
      return LiquidWallet.syncWallet(wallet as LiquidWallet);
    }
    throw UnimplementedError('Unsupported Wallet subclass');
  }

  Future<Iterable<Tx>> getTxs(WalletType type);

  Future<Address> getAddress(int index, AddressKind kind);
}
