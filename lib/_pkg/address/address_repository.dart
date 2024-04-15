import 'dart:convert';

import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/storage/hive.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';

class AddressRepository {
  AddressRepository({required this.storage});

  HiveStorage storage;

  Future<(List<Address>?, dynamic)> listAddresses(Wallet wallet) async {
    try {
      final (addrsStr, _) = await storage.getValue('address.${wallet.id}');
      List<dynamic> addrsJson = jsonDecode(addrsStr!);
      final addrs = addrsJson.map((adJson) => Address.fromJson(adJson)).toList();
      return (addrs, null);
    } catch (e) {
      return (null, e);
    }
  }

  // TODO: Potential optimization: Do this sync/merge only if txlist.length, lastUnused, wallet balance differ from what's there in storage.
  // Otherwise, skip this operation and go with previous calculation that is stored in storage.
  Future<(List<Address>?, dynamic)> syncAddresses(
      List<Tx> txs, List<Address> oldAddresses, AddressKind kind, Wallet wallet) async {
    try {
      final lastUnused = await Address.getLastUnused(wallet, kind);

      List<Address> addresses = await Address.syncAddresses(txs, lastUnused, oldAddresses, wallet, kind);

      return (addresses, null);
    } catch (e) {
      return (null, e);
    }
  }

  Future<void> persistAddresses(Wallet wallet, List<Address> addresses) async {
    List<Map<String, dynamic>> addressesJson = addresses.map((addr) => addr.toJson()).toList();
    String encoded = jsonEncode(addressesJson);
    await storage.saveValue(key: 'addr.${wallet.id}', value: encoded);
  }
}
