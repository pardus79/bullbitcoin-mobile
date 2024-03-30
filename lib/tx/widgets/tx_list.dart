import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            print('TxList: tx: $tx');
            context.read<TxBloc>().add(SelectTx(tx: tx));
            GoRouter.of(context).push('/tx');
          },
        );
      },
      itemCount: txs.length,
    );
  }
}
