import 'dart:convert';

import 'package:bb_arch/_pkg/storage/hive.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';

class TxRepository {
  TxRepository({required this.storage}) {}

  HiveStorage storage;

  Future<(List<Tx>?, dynamic)> listTxs(Wallet w) async {
    try {
      // final (txStr, _) = await storage.getValue('tx.${w.id}');
      // List<dynamic> txsJson = jsonDecode(txStr!);
      // final txs = txsJson.map((txJson) => Tx.fromJson(txJson)).toList();

      final updatedTxs = await w.getTransactions(w.type);

      return (updatedTxs.toList(), null);
    } catch (e) {
      return (null, e);
    }
  }
}
