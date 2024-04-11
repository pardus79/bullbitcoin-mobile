// ignore_for_file: avoid_print

import 'package:bb_arch/wallet-setup/view/wallet_create_page.dart';
import 'package:bb_arch/wallet-setup/view/wallet_import_page.dart';
import 'package:bb_arch/wallet-setup/view/wallet_recover_page.dart';
import 'package:bb_arch/wallet-setup/view/wallet_setup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class WalletSetupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Wallet setup'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return ListTile(
                    title: const Text('Create new'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      GoRouter.of(context).push(WalletCreatePage.route);
                    },
                  );
                case 1:
                  return ListTile(
                    title: const Text('Import'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      GoRouter.of(context).push(WalletImportPage.route);
                    },
                  );
                case 2:
                  return ListTile(
                    title: const Text('Recover'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      GoRouter.of(context).push(WalletRecoverPage.route);
                    },
                  );
                default:
                  return const ListTile(
                    title: Text('Hanled index'),
                  );
              }
            },
            itemCount: 3),
      ),
    );
  }
}
