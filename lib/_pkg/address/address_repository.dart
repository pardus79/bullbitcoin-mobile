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

  // TODO: Potential optimization: Do this sync/merge only if txlist.length, lastUnused, wallet balance differ from what's there in storage.
  // Otherwise, skip this operation and go with previous calculation that is stored in storage.
  Future<(List<Address>?, dynamic)> syncAddresses(
      List<Tx> txs, List<Address> oldAddresses, AddressKind kind, Wallet wallet) async {
    try {
      final lastUnused = await Address.getLastUnused(wallet, kind);

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
          BitcoinAddress finalBitcoinAddr = addr as BitcoinAddress;
          final Set<BitcoinTx> txsPaidToThisAddress = {};

          // Loop to check again receive txs to this address
          for (int i = 0; i < txs.length; i++) {
            final Tx tx = txs[i];
            final BitcoinTx btx = tx as BitcoinTx;

            for (int j = 0; j < btx.outputs.length; j++) {
              final out = btx.outputs[j];
              if (out.address == finalBitcoinAddr.address) {
                finalBitcoinAddr = finalBitcoinAddr.copyWith(
                    status: AddressStatus.used,
                    txCount: finalBitcoinAddr.txCount + 1,
                    balance: finalBitcoinAddr.balance + out.value,
                    receiveTxIds: [...finalBitcoinAddr.receiveTxIds, btx.id]);
                txsPaidToThisAddress.add(btx);
                break;
              }
            }
          }

          // Loop to check against spent txs from this address
          for (int i = 0; i < txs.length; i++) {
            bool txnCounted = false;
            final Tx tx = txs[i];
            final BitcoinTx btx = tx as BitcoinTx;
            for (int j = 0; j < btx.inputs.length; j++) {
              final txin = btx.inputs[j];

              for (int k = 0; k < txsPaidToThisAddress.length; k++) {
                final paidTx = txsPaidToThisAddress.elementAt(k);
                if (paidTx.id == txin.previousOutput.txid &&
                    paidTx.outputs[txin.previousOutput.vout].address == finalBitcoinAddr.address) {
                  // Single txn spending from multiple UTXOs should be counted only once.
                  if (txnCounted) {
                    finalBitcoinAddr = finalBitcoinAddr.copyWith(
                      status: AddressStatus.used,
                      balance: finalBitcoinAddr.balance - paidTx.outputs[txin.previousOutput.vout].value,
                    );
                  } else {
                    finalBitcoinAddr = finalBitcoinAddr.copyWith(
                      status: AddressStatus.used,
                      txCount: finalBitcoinAddr.txCount + 1,
                      balance: finalBitcoinAddr.balance - paidTx.outputs[txin.previousOutput.vout].value,
                      sendTxIds: [...finalBitcoinAddr.sendTxIds, btx.id],
                    );
                    txnCounted = true;
                  }
                }
              }
            }
          }
          addresses.add(finalBitcoinAddr);
        }
      }

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
