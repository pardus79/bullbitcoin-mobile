import 'dart:convert';

import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/address/models/bitcoin_address.dart';
import 'package:bb_arch/_pkg/storage/hive.dart';
import 'package:bb_arch/_pkg/tx/models/bitcoin_tx.dart';
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

  Future<(List<Address>?, dynamic)> syncAddresses(List<Tx> txs, List<Address> oldAddresses, Wallet wallet) async {
    try {
      final lastUnused = await Address.getLastUnused(wallet);

      List<Address> addresses = [];

      for (var i = 0; i <= lastUnused.index; i++) {
        final addr = await wallet.getAddress(i);
        // TODO: How to make contains work with manually implementing == operator? in Address
        // bool exists = oldAddresses.contains(addr);
        // Address finalAddr = exists ? oldAddresses.firstWhere((element) => element.address == addr.address) : addr;
        // Address finalAddr = addr;

        // Pick from Txs
        if (wallet.type == WalletType.Bitcoin) {
          BitcoinAddress finalBitcoinAddr = addr as BitcoinAddress;
          final Set<(BitcoinTx, Address)> txsPaidToThisAddress = {};
          for (int i = 0; i < txs.length; i++) {
            final Tx tx = txs[i];
            final BitcoinTx btx = tx as BitcoinTx;

            for (int j = 0; j < btx.outputs.length; j++) {
              final out = btx.outputs[j];
              if (out.address == finalBitcoinAddr.address) {
                // if (out.address.endsWith('628y')) {
                //   print('Found: ${out.address} in ${btx.id}');
                // }
                finalBitcoinAddr =
                    finalBitcoinAddr.copyWith(status: AddressStatus.used, txCount: finalBitcoinAddr.txCount + 1);
                txsPaidToThisAddress.add((btx, finalBitcoinAddr));
                break;
              }
            }
            //if (finalBitcoinAddr.address.endsWith('628y') && btx.id.endsWith('e394')) {
            //  print(btx.id);
            //}
          }
          for (int i = 0; i < txs.length; i++) {
            final Tx tx = txs[i];
            final BitcoinTx btx = tx as BitcoinTx;
            for (int j = 0; j < btx.inputs.length; j++) {
              final txin = btx.inputs[j];

              for (int k = 0; k < txsPaidToThisAddress.length; k++) {
                final (paidTx, fAddr) = txsPaidToThisAddress.elementAt(k);
                if (paidTx.id == txin.previousOutput.txid &&
                    paidTx.outputs[txin.previousOutput.vout].address == finalBitcoinAddr.address) {
                  finalBitcoinAddr =
                      finalBitcoinAddr.copyWith(status: AddressStatus.used, txCount: finalBitcoinAddr.txCount + 1);
                }
              }

              // TODO: Also have to match txout
              // if (txsPaidToThisAddress.map((t) => t.id).contains(txin.previousOutput.txid)) {
              //   finalBitcoinAddr =
              //       finalBitcoinAddr.copyWith(status: AddressStatus.used, txCount: finalBitcoinAddr.txCount + 1);
              // }
            }
          }
          addresses.add(finalBitcoinAddr);
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

  Future<void> persistAddresses(Wallet wallet, List<Address> addresses) async {
    List<Map<String, dynamic>> addressesJson = addresses.map((addr) => addr.toJson()).toList();
    String encoded = jsonEncode(addressesJson);
    await storage.saveValue(key: 'addr.${wallet.id}', value: encoded);
  }
}
