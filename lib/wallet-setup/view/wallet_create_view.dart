// ignore_for_file: avoid_print

import 'package:bb_arch/_ui/bb_page.dart';
import 'package:bb_arch/wallet-setup/view/wallet_type_selection_page.dart';
import 'package:bb_arch/wallet/bloc/walletsensitive_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WalletCreateScaffold extends StatelessWidget {
  const WalletCreateScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BBScaffold(title: 'Wallet Create', child: WalletCreateView());
  }
}

class WalletCreateView extends StatelessWidget {
  const WalletCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    final seed = context.select((WalletSensitiveBloc cubit) => cubit.state.seed);
    final walletName = context.select(
        (WalletSensitiveBloc cubit) => cubit.state.seed?.mnemonic.split(' ').getRange(0, 2).join('-') ?? 'wallet-name');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Mnemonic:'),
          Text(seed?.mnemonic ?? 'Loading...'),
          const SizedBox(height: 8),
          const Text('Wallet name:'),
          Text(walletName),
          const SizedBox(height: 16),
          TextButton(
              onPressed: () async {
                print('Create clicked');
                final (seedFingerprint, _) = await seed!.getBdkFingerprint();
                final newSeed = seed.copyWith(fingerprint: seedFingerprint ?? '');
                context
                    .read<WalletSensitiveBloc>()
                    .add(DeriveWalletFromStoredSeed(seed: newSeed, walletName: walletName));
                GoRouter.of(context).push(WalletTypeSelectionPage.route);
              },
              child: const Text('Create wallet')),
        ],
      ),
    );
  }
}
