import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/tx/widgets/tx_list.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:bb_arch/wallet/widgets/wallet_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TxView extends StatelessWidget {
  const TxView({super.key});

  @override
  Widget build(BuildContext context) {
    final tx = context.select((TxBloc cubit) => cubit.state.selectedTx);
    print('tx: $tx');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Tx'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tx ID'),
            Text(tx?.id ?? ''),
            const SizedBox(height: 8),
            const Text('Amount'),
            Text(tx?.amount.toString() ?? ''),
            const SizedBox(height: 8),
            const Text('Time'),
            Text(DateTime.fromMillisecondsSinceEpoch((tx?.timestamp ?? 0) * 1000).toString()),
            const SizedBox(height: 8),
            const Text('Fee'),
            Text(tx?.fee.toString() ?? ''),
            const SizedBox(height: 8),
            const Text('Coin Type'),
            Text(tx?.type.name ?? ''),
            const SizedBox(height: 8),
            const Text('Inputs'),
            const Text('[TBD]'),
            const SizedBox(height: 8),
            const Text('Outputs'),
            const Text('[TBD]'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Load Tx', child: const Icon(Icons.front_loader), heroTag: 'loadTx', onPressed: () {}),
    );
  }
}
