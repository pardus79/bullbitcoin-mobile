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
}
