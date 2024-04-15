import 'dart:convert';

import 'package:bb_arch/_pkg/storage/hive.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:isar/isar.dart';

class TxRepository {
  TxRepository({required this.storage, required this.isar});

  Isar isar;
  HiveStorage storage;

  Future<(List<Tx>?, dynamic)> listTxs(Wallet wallet) async {
    try {
      final (txStr, _) = await storage.getValue('tx.${wallet.id}');
      List<dynamic> txsJson = jsonDecode(txStr!);
      final txs = txsJson.map((txJson) => Tx.fromJson(txJson)).toList();
      return (txs, null);
    } catch (e) {
      return (null, e);
    }
  }

  // TODO: Pass List<Tx> as another parameter, which has list of Txs to be merged with
  Future<(List<Tx>?, dynamic)> syncTxs(Wallet wallet) async {
    try {
      // TODO: Ideally wallet.getTxs should be split as fetchTxs and processTxs
      // So first time a tx is fetched from bdk (Not existing in local storage), or unconfirmed txs, it is processed.
      // which means, first time tx is fetched or for unconfirmed txs, it's inputs, outputs and other fields are processed.
      // Then, next time, when the same tx is fetched, it's ignored and local Tx version is used.

      final updatedTxs = await wallet.getTxs(wallet.type);
      final sortedTxs = updatedTxs.toList();
      sortedTxs.sort(
        (a, b) => b.timestamp - a.timestamp,
      );

      return (sortedTxs, null);
    } catch (e) {
      return (null, e);
    }
  }

  Future<void> persistTxs(Wallet wallet, List<Tx> txs) async {
    List<Map<String, dynamic>> txsJson = txs.map((tx) => tx.toJson()).toList();
    String encoded = jsonEncode(txsJson);
    await storage.saveValue(key: 'tx.${wallet.id}', value: encoded);
  }
}
