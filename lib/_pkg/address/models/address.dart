import 'dart:core';

import 'package:bb_arch/_pkg/address/models/bitcoin_address.dart';
import 'package:bb_arch/_pkg/address/models/liquid_address.dart';
import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/liquid_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';

enum AddressKind {
  deposit,
  change,
  external,
}

enum AddressStatus {
  unused,
  active,
  used,
  copied,
}

enum AddressType { Bitcoin, Liquid, Lightning, Usdt }

extension AddressTypeExtension on AddressType {
  String get name {
    switch (this) {
      case AddressType.Bitcoin:
        return 'Bitcoin';
      case AddressType.Liquid:
        return 'Liquid';
      case AddressType.Lightning:
        return 'Lightning';
      case AddressType.Usdt:
        return 'Usdt';
    }
  }
}

abstract class Address {
  String address = '';
  int index = 0;
  AddressKind kind = AddressKind.deposit;
  AddressStatus state = AddressStatus.unused;
  AddressType type = AddressType.Bitcoin;
  int balance = 0;
  bool spendable = true;
  List<String>? labels;
  int txCount = 0;
  List<String> txIds = [];
  String? walletId;

  Map<String, dynamic> toJson();

  static Address fromJson(Map<String, dynamic> json) {
    if (json.containsKey('type') && json['type'] == AddressType.Bitcoin.name) {
      return BitcoinAddress.fromJson(json);
      // } else if (json.containsKey('type') && json['type'] == TxType.Liquid.name) {
      //   return LiquidAddress.fromJson(json);
    }
    throw UnimplementedError('Unsupported Address subclass');
  }

  static Future<Address> getLastUnused(Wallet w, AddressKind kind) {
    if (w.type == WalletType.Bitcoin) {
      return BitcoinAddress.getLastUnused(w as BitcoinWallet, kind);
    } else if (w.type == WalletType.Liquid) {
      return LiquidAddress.getLastUnused(w as LiquidWallet);
    }
    throw UnimplementedError('Unsupported Address subclass');
  }

  static Future<Address> loadFromNative(dynamic addr, Wallet w, AddressKind kind) async {
    if (w.type == WalletType.Bitcoin) {
      return BitcoinAddress.loadFromNative(addr, w as BitcoinWallet, kind);
    } else if (w.type == WalletType.Liquid) {
      return LiquidAddress.loadFromNative(addr, w as LiquidWallet);
    }
    throw UnimplementedError('Unsupported Tx subclass');
  }
}
