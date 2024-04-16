// ignore_for_file: avoid_print

import 'package:bb_arch/_pkg/seed/models/seed.dart';
import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/wallet-setup/view/wallet_type_selection_page.dart';
import 'package:bb_arch/wallet/bloc/walletsensitive_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WalletRecoverView extends StatelessWidget {
  const WalletRecoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Wallet Recover'),
        ),
        body: Column(
          children: [
            TextButton(
                onPressed: () async {
                  Seed seed = const Seed(
                    mnemonic: 'move decline opera album crisp nice ozone casual gate ozone cycle judge',
                    passphrase: 'Pass1234',
                    walletType: WalletType.Bitcoin,
                    network: NetworkType.Testnet,
                    fingerprint: '',
                  );
                  final (seedFingerprint, _) = await seed.getBdkFingerprint();
                  seed = seed.copyWith(fingerprint: seedFingerprint ?? '');
                  context
                      .read<WalletSensitiveBloc>()
                      .add(DeriveWalletFromStoredSeed(seed: seed, walletName: 'Pikachu'));
                  GoRouter.of(context).push(WalletTypeSelectionPage.route);
                  print('Pikachu wallet');
                },
                child: const Text('Pikachu wallet')),
            TextButton(
                onPressed: () async {
                  Seed seed = const Seed(
                    mnemonic: 'lumber tackle notice city expand cherry tonight people blue cactus forward scissors',
                    passphrase: '',
                    walletType: WalletType.Bitcoin,
                    network: NetworkType.Testnet,
                    fingerprint: '',
                  );
                  final (seedFingerprint, _) = await seed.getBdkFingerprint();
                  seed = seed.copyWith(fingerprint: seedFingerprint ?? '');
                  context.read<WalletSensitiveBloc>().add(DeriveWalletFromStoredSeed(seed: seed, walletName: 'Naruto'));
                  GoRouter.of(context).push(WalletTypeSelectionPage.route);
                  print('Naruto wallet');
                },
                child: const Text('Naruto wallet')),
            TextButton(
                onPressed: () async {
                  Seed seed = const Seed(
                      mnemonic: 'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial',
                      passphrase: '',
                      walletType: WalletType.Bitcoin,
                      network: NetworkType.Testnet,
                      fingerprint: '');
                  final (seedFingerprint, _) = await seed.getBdkFingerprint();
                  seed = seed.copyWith(fingerprint: seedFingerprint ?? '');
                  context.read<WalletSensitiveBloc>().add(DeriveWalletFromStoredSeed(seed: seed, walletName: 'Vegeta'));
                  GoRouter.of(context).push(WalletTypeSelectionPage.route);
                  print('Vegeta wallet');
                },
                child: const Text('Vegeta wallet')),
            TextButton(
                onPressed: () async {
                  Seed seed = const Seed(
                      mnemonic:
                          'cave arrest spot bleak song diesel wire bleak wolf stand enhance guess coach below next smoke power school edit crowd photo ordinary pottery train',
                      passphrase: '',
                      walletType: WalletType.Bitcoin,
                      network: NetworkType.Testnet,
                      fingerprint: '');
                  final (seedFingerprint, _) = await seed.getBdkFingerprint();
                  seed = seed.copyWith(fingerprint: seedFingerprint ?? '');
                  context
                      .read<WalletSensitiveBloc>()
                      .add(DeriveWalletFromStoredSeed(seed: seed, walletName: 'First24'));
                  GoRouter.of(context).push(WalletTypeSelectionPage.route);
                  print('First24 wallet');
                },
                child: const Text('First24 wallet')),
            TextButton(
                onPressed: () async {
                  Seed seed = const Seed(
                      mnemonic: 'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial',
                      passphrase: '',
                      walletType: WalletType.Liquid,
                      network: NetworkType.Testnet,
                      fingerprint: '');
                  final (seedFingerprint, _) = await seed.getBdkFingerprint();
                  seed = seed.copyWith(fingerprint: seedFingerprint ?? '');
                  context
                      .read<WalletSensitiveBloc>()
                      .add(DeriveWalletFromStoredSeed(seed: seed, walletName: 'L-Vegeta'));
                  GoRouter.of(context).push(WalletTypeSelectionPage.route);
                  print('Vegeta Liquid wallet');
                },
                child: const Text('Vegeta liquid wallet')),
          ],
        ));
  }
}
