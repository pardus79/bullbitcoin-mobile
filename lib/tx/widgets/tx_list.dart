import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:flutter/material.dart';

class TxList extends StatelessWidget {
  const TxList({
    super.key,
    required this.txs,
  });

  final List<Tx> txs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Tx tx = txs[index];
        String amount = '${tx.amount} - ${(tx.amount ?? 0) > 0 ? 'received' : 'sent'}';
        return ListTile(
          title: Text(amount),
          subtitle: Text((DateTime.fromMillisecondsSinceEpoch(tx.timestamp * 1000)).toString()),
        );
      },
      itemCount: txs.length,
    );
  }
}
