import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/tx/models/bitcoin_tx.dart';
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
    // print('tx: $tx');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Tx'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              if (tx is BitcoinTx)
                Column(
                  children: tx.inputs.map((e) {
                    return Column(children: [
                      Text(e.previousOutput.toString()),
                      ...e.witness.map((w) => Text(w)).toList(),
                      const SizedBox(height: 4),
                    ]);
                  }).toList(),
                ),
              const SizedBox(height: 8),
              const Text('Outputs'),
              if (tx is BitcoinTx)
                Column(
                  children: tx.outputs.map((e) {
                    return Text(e.address);
                  }).toList(),
                ),
              const Text('Outputs'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Load Tx', heroTag: 'loadTx', onPressed: () {}, child: const Icon(Icons.front_loader)),
    );
  }
}
