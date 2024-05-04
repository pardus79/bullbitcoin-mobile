import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/tx/models/bitcoin_tx.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/tx/widgets/tx_list.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:bb_arch/wallet/widgets/wallet_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BitcoinTxView extends StatelessWidget {
  const BitcoinTxView({super.key});

  @override
  Widget build(BuildContext context) {
    final tx = context.select((TxBloc cubit) => cubit.state.selectedTx);

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
                ...tx.inputs.map((e) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('- ${e.previousOutput.toString()}'),
                    Text('- Witness (${e.witness.length})'),
                    ...e.witness.map((w) => Text('    - $w')).toList(),
                    const SizedBox(height: 16),
                  ]);
                }).toList(),
              const SizedBox(height: 8),
              const Text('Outputs'),
              if (tx is BitcoinTx) ...tx.outputs.map((e) => AddressRow(walletId: tx.walletId ?? '', address: e.address))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Load Tx', heroTag: 'loadTx', onPressed: () {}, child: const Icon(Icons.front_loader)),
    );
  }
}

class AddressRow extends StatelessWidget {
  const AddressRow({super.key, required this.walletId, required this.address});

  final String walletId;
  final String address;

  @override
  Widget build(BuildContext context) {
    final isMyAddress = context.select((AddressBloc bloc) => bloc.state.isMyAddress(address));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: isMyAddress
          ? TextButton(
              child: Text(' - $address'),
              onPressed: () {
                GoRouter.of(context).push('/wallet/$walletId/address/$address');
              },
            )
          : Text(' - $address'),
    );
  }
}
