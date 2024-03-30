import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/tx/widgets/tx_list.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:bb_arch/wallet/widgets/wallet_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    final wallet = context.select((WalletBloc cubit) => cubit.state.selectedWallet!);
    final loadStatus = context.select((TxBloc cubit) => cubit.state.status);
    final txs = context.select((TxBloc cubit) => cubit.state.txs);

/*
    if (loadStatus == LoadStatus.loading) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(wallet.name),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    */
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(wallet.name),
        actions: [
          loadStatus == LoadStatus.loading ? const CircularProgressIndicator() : const SizedBox.shrink(),
        ],
      ),
      body: Column(
        children: [
          WalletHeading(wallet: wallet, txs: txs),
          Expanded(
            child: TxList(txs: txs),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Load Tx',
          heroTag: 'loadTx',
          onPressed: () {
            context.read<TxBloc>().add(SyncTxs(wallet: wallet));
          },
          child: const Icon(Icons.front_loader)),
    );
  }
}
