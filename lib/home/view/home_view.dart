// ignore_for_file: avoid_print

import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/settings/view/settings_page.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:bb_arch/wallet/widgets/wallets_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void _action1() {
    print('action1');
  }

  void _sync() {
    context.read<WalletBloc>().add(SyncAllWallets());
  }

  @override
  Widget build(BuildContext context) {
    final loadStatus = context.select((WalletBloc cubit) => cubit.state.status);
    final wallets = context.select((WalletBloc cubit) => cubit.state.wallets);
    final syncStatus = context.select((WalletBloc cubit) => cubit.state.syncWalletStatus);

    print('HomeView.build');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          loadStatus == LoadStatus.loading ? const CircularProgressIndicator() : const SizedBox.shrink(),
          IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Settings',
              onPressed: () {
                GoRouter.of(context).push(SettingsPage.route);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WalletList(wallets: wallets, syncStatus: syncStatus),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _action1,
            tooltip: 'Load',
            heroTag: 'loadTag',
            child: const Icon(Icons.sync),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _sync,
            tooltip: 'Sync',
            heroTag: 'syncTag',
            child: const Icon(Icons.cloud_sync),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
