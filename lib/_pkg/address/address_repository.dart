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

  Future<(List<Address>?, dynamic)> syncAddresses(List<Address> oldAddresses, Wallet wallet) async {
    try {
      final lastUnused = await Address.getLastUnused(wallet);

      List<Address> addresses = [];

      for (var i = 0; i <= lastUnused.index; i++) {
        final addr = await wallet.getAddress(i);
        bool exists = oldAddresses.contains(addr);
        if (!exists) {
          addresses.add(addr);
        } else {
          addresses.add(oldAddresses[i]);
        }
        /*
        final address = await bdkWallet.getAddress(
          addressIndex: bdk.AddressIndex.peek(index: i),
        );
        final contain = wallet.myAddressBook.where(
          (element) => element.address == address.address,
        );
        if (contain.isEmpty)
          addresses.add(
            Address(
              address: address.address,
              index: address.index,
              kind: AddressKind.deposit,
              state: AddressStatus.unused,
            ),
          );
          */
      }
      // Future.delayed(const Duration(milliseconds: 1600));
      addresses.sort((a, b) {
        return b.index.compareTo(a.index);
      });

      return (addresses, null);
    } catch (e) {
      return (null, e);
    }
  }
}
