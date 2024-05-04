import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key, required this.walletId});

  final String walletId;

  @override
  Widget build(BuildContext context) {
    final address = context.select((AddressBloc cubit) => cubit.state.selectedAddress);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Address Id'),
              Text(address?.address ?? ''),
              const SizedBox(height: 8),
              const Text('Index'),
              Text(address?.index.toString() ?? ''),
              const SizedBox(height: 8),
              const Text('Kind'),
              Text(address?.kind.name ?? ''),
              const SizedBox(height: 8),
              const Text('Status'),
              Text(address?.status.name ?? ''),
              const SizedBox(height: 8),
              const Text('Type'),
              Text(address?.type.name ?? ''),
              const SizedBox(height: 8),
              const Text('Balance'),
              Text(address?.balance.toString() ?? ''),
              const SizedBox(height: 8),
              const Text('Tx count'),
              Text(address?.txCount.toString() ?? ''),
              const SizedBox(height: 8),
              const Text('Receive Txs'),
              ...(address?.receiveTxIds.map((txid) => TxRow(walletId: walletId, txid: txid)) ?? []),
              const SizedBox(height: 8),
              const Text('Spend Txs'),
              ...(address?.sendTxIds.map((txid) => TxRow(walletId: walletId, txid: txid)) ?? []),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Load Tx', heroTag: 'loadTx', onPressed: () {}, child: const Icon(Icons.front_loader)),
    );
  }
}

class TxRow extends StatelessWidget {
  const TxRow({super.key, required this.walletId, required this.txid});

  final String walletId;
  final String txid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        child: Text(txid),
        onPressed: () {
          GoRouter.of(context).push('/wallet/$walletId/tx/$txid');
        },
      ),
    );
  }
}
