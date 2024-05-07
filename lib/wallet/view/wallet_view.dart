import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/_ui/bb_page.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/tx/widgets/tx_list.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:bb_arch/wallet/widgets/wallet_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletScaffold extends StatelessWidget {
  const WalletScaffold({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final loadStatus = context.select((TxBloc cubit) => cubit.state.status);
    final wallet = context.select((WalletBloc cubit) => cubit.state.selectedWallet!);
    return BBScaffold(
        title: wallet.name,
        actions: [
          loadStatus == LoadStatus.loading ? const CircularProgressIndicator() : const SizedBox.shrink(),
        ],
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<TxBloc>().add(SyncTxs(wallet: wallet));
              },
              tooltip: 'Load Tx',
              heroTag: 'loadTag',
              child: const Icon(Icons.sync),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                context.read<TxBloc>().add(SyncTxs(wallet: wallet));
              },
              tooltip: 'Sync',
              heroTag: 'syncTag',
              child: const Icon(Icons.cloud_sync),
            ),
          ],
        ),
        child: WalletView(id: id));
  }
}

class WalletView extends StatelessWidget {
  const WalletView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final wallet = context.select((WalletBloc cubit) => cubit.state.selectedWallet!);
    final txs = context.select((TxBloc cubit) => cubit.state.txs);

    return Column(
      children: [
        WalletHeader(wallet: wallet, txs: txs),
        Expanded(
          child: TxList(txs: txs),
        ),
      ],
    );
  }
}
