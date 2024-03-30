import 'dart:convert';

import 'package:bb_arch/_pkg/storage/hive.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';

class TxRepository {
  TxRepository({required this.storage}) {}

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

  Future<(List<Tx>?, dynamic)> syncTxs(Wallet wallet) async {
    try {
      final updatedTxs = await wallet.getTransactions(wallet.type);
      final sortedTxs = updatedTxs.toList();
      sortedTxs.sort(
        (a, b) => b.timestamp - a.timestamp,
      );

      return (sortedTxs, null);
    } catch (e) {
      return (null, e);
    }
  }

  Future<void> saveTxs(Wallet wallet, List<Tx> txs) async {
    List<Map<String, dynamic>> txsJson = txs.map((tx) => tx.toJson()).toList();
    String encoded = jsonEncode(txsJson);
    await storage.saveValue(key: 'tx.${wallet.id}', value: encoded);
  }
}
