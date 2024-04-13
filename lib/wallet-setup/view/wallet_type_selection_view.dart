// ignore_for_file: avoid_print

import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletTypeSelectionView extends StatelessWidget {
  const WalletTypeSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final wallets = context.select((WalletBloc cubit) => cubit.state.derivedWallets);
    final syncStatuses = context.select((WalletBloc cubit) => cubit.state.syncDerivedWalletStatus);
    print('WalletTypeSelectionView');
    print(wallets.length);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Wallet TypeSelection'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final w = wallets[index] as BitcoinWallet;
            final syncStatus = syncStatuses[index];
            return ListTile(
              title: Text('${w.name} (${w.fingerprint}: ${w.id})'),
              subtitle: Text('Tx count: 0, Balance: ${w.balance}'),
              leading: syncStatus.name == 'loading'
                  ? const CircularProgressIndicator()
                  : syncStatus.name == 'initial'
                      ? const Icon(Icons.hourglass_empty)
                      : const Icon(Icons.check),
              onTap: () {
                context.read<WalletBloc>().add(SelectWallet(wallet: wallets[index]));
              },
            );
          },
          itemCount: wallets.length,
        ));
  }
}
