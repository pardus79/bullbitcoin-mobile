// ignore_for_file: avoid_print

import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/wallet-setup/view/wallet_type_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletRecoverView extends StatelessWidget {
  const WalletRecoverView({super.key});

  void navigateToWalletTypePage(
      BuildContext context, String mnemonic, String passphrase, String walletName, String walletType) {
    final baseRoute = WalletTypeSelectionPage.route;
    final mnemonicParam = '${WalletTypeSelectionPage.routeQParamMnemonic}=$mnemonic';
    final passphraseParam = '${WalletTypeSelectionPage.routeQParamPassphrase}=$passphrase';
    final walletNameParam = '${WalletTypeSelectionPage.routeQParamWalletName}=$walletName';
    final walletTypeParam = '${WalletTypeSelectionPage.routeQParamWalletType}=$walletType';

    final finalRoute = '$baseRoute?$mnemonicParam&$passphraseParam&$walletNameParam&$walletTypeParam';
    GoRouter.of(context).push(finalRoute);
  }

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
                  const mnemonic = 'move decline opera album crisp nice ozone casual gate ozone cycle judge';
                  const passphrase = 'Pass1234';
                  const walletName = 'Pikachu';
                  final walletType = WalletType.Bitcoin.name;

                  navigateToWalletTypePage(context, mnemonic, passphrase, walletName, walletType);
                  print('Pikachu wallet');
                },
                child: const Text('Pikachu wallet')),
            TextButton(
                onPressed: () async {
                  const mnemonic =
                      'lumber tackle notice city expand cherry tonight people blue cactus forward scissors';
                  const passphrase = '';
                  const walletName = 'Naruto';
                  final walletType = WalletType.Bitcoin.name;

                  navigateToWalletTypePage(context, mnemonic, passphrase, walletName, walletType);
                  print('Naruto wallet');
                },
                child: const Text('Naruto wallet')),
            TextButton(
                onPressed: () async {
                  const mnemonic = 'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial';
                  const passphrase = '';
                  const walletName = 'Vegeta';
                  final walletType = WalletType.Bitcoin.name;

                  navigateToWalletTypePage(context, mnemonic, passphrase, walletName, walletType);
                  print('Vegeta wallet');
                },
                child: const Text('Vegeta wallet')),
            TextButton(
                onPressed: () async {
                  const mnemonic =
                      'cave arrest spot bleak song diesel wire bleak wolf stand enhance guess coach below next smoke power school edit crowd photo ordinary pottery train';
                  const passphrase = '';
                  const walletName = 'First24';
                  final walletType = WalletType.Bitcoin.name;

                  navigateToWalletTypePage(context, mnemonic, passphrase, walletName, walletType);
                  print('First24 wallet');
                },
                child: const Text('First24 wallet')),
            TextButton(
                onPressed: () async {
                  const mnemonic = 'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial';
                  const passphrase = '';
                  const walletName = 'L-Vegeta';
                  final walletType = WalletType.Liquid.name;

                  navigateToWalletTypePage(context, mnemonic, passphrase, walletName, walletType);
                  print('Vegeta Liquid wallet');
                },
                child: const Text('Vegeta liquid wallet')),
          ],
        ));
  }
}
