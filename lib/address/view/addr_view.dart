import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/address/models/bitcoin_address.dart';
import 'package:bb_arch/_pkg/address/models/liquid_address.dart';
import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/tx/models/bitcoin_tx.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:bb_arch/address/widgets/bitcoin_address_list.dart';
import 'package:bb_arch/address/widgets/liquid_address_list.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/tx/widgets/tx_list.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:bb_arch/wallet/widgets/wallet_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final wallet = context.select((WalletBloc cubit) => cubit.state.selectedWallet);
    final address = context.select((AddressBloc cubit) => cubit.state.selectedAddress);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
              Text(address?.state.name ?? ''),
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
              ...(address?.receiveTxIds.map((txid) {
                        return Column(children: [
                          Text(txid),
                          const SizedBox(height: 4),
                        ]);
                      }) ??
                      [])
                  .toList(),
              const SizedBox(height: 8),
              const Text('Spend Txs'),
              ...(address?.sendTxIds.map((txid) {
                        return Column(children: [
                          Text(txid),
                          const SizedBox(height: 4),
                        ]);
                      }) ??
                      [])
                  .toList(),
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
