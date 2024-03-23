// ignore_for_file: avoid_print

import 'package:bb_arch/_pkg/wallet/wallet_repository.dart';
import 'package:bb_arch/home/cubit/home_state.dart';
import 'package:bb_arch/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counter = 0;

  @override
  void initState() {
    context.read<HomeCubit>().readWallets();
    super.initState();
  }

  void _action1() {
    print('action1');
  }

  void _sync() {
    context.read<HomeCubit>().syncAllWallets();
  }

  @override
  Widget build(BuildContext context) {
    final wallets = context.select((HomeCubit cubit) => cubit.state.wallets);
    final status = context.select((HomeCubit cubit) => cubit.state.status);
    final syncStatus = context.select((HomeCubit cubit) => cubit.state.syncWalletStatus);

    print('HomeView.build:');
    // print(status);
    // print(wallets);

    if (status == WalletStatus.loading) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${wallets[index].type.name}: ${wallets[index].network.name}'),
                    subtitle: Text(wallets[index].balance.toString()),
                    leading: syncStatus[index].name == 'loading'
                        ? const CircularProgressIndicator()
                        : syncStatus[index].name == 'initial'
                            ? const Icon(Icons.hourglass_empty)
                            : const Icon(Icons.check),
                    trailing: const Icon(Icons.chevron_right),
                  );
                },
                itemCount: wallets.length,
              ),
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
            child: const Icon(Icons.front_loader),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _sync,
            tooltip: 'Sync',
            child: const Icon(Icons.sync),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
