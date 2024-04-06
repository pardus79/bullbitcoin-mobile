import 'dart:core';

import 'package:bb_arch/_pkg/address/models/bitcoin_address.dart';
import 'package:bb_arch/_pkg/address/models/liquid_address.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/liquid_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';

enum AddressKind {
  deposit,
  change,
  external,
  confidential,
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
  List<String> receiveTxIds = [];
  List<String> sendTxIds = [];
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

  static Future<List<Address>> syncAddresses(
      List<Tx> txs, Address lastUnused, List<Address> oldAddresses, Wallet wallet, AddressKind kind) async {
    List<Address> addresses = [];

    for (var i = 0; i <= lastUnused.index; i++) {
      final addr = await wallet.getAddress(i, kind);
      print(addr.address);
      // TODO: How to make contains work with manually implementing == operator? in Address
      // bool exists = oldAddresses.contains(addr);
      // Address finalAddr = exists ? oldAddresses.firstWhere((element) => element.address == addr.address) : addr;
      // Address finalAddr = addr;

      // Pick from Txs
      if (wallet.type == WalletType.Bitcoin) {
        Address finalBitcoinAddr =
            BitcoinAddress.processAddress(txs, lastUnused, oldAddresses, wallet, kind, addr as BitcoinAddress);
        addresses.add(finalBitcoinAddr);
      } else if (wallet.type == WalletType.Liquid) {
        Address finalBitcoinAddr =
            LiquidAddress.processAddress(txs, lastUnused, oldAddresses, wallet, kind, addr as LiquidAddress);
        addresses.add(finalBitcoinAddr);
      }
    }

    addresses.sort((a, b) {
      return b.index.compareTo(a.index);
    });
    return addresses;
  }
}
