// ignore_for_file: avoid_print

import 'package:bb_arch/wallet-setup/view/wallet_setup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return ListTile(
                    title: const Text('Testnet mode'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      print('SettingsView: Testnet');
                    },
                  );
                case 1:
                  return ListTile(
                    title: const Text('Default RBF'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      print('SettingsView: Default RBF');
                    },
                  );
                case 2:
                  return ListTile(
                    title: const Text('Default fee rate'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      print('SettingsView: Default fee rate');
                    },
                  );
                case 3:
                  return ListTile(
                    title: const Text('Create / Import wallet'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      GoRouter.of(context).push(WalletSetupPage.route);
                    },
                  );
                case 4:
                  return ListTile(
                    title: const Text('Broadcast'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      print('SettingsView: Broadcast');
                    },
                  );
                case 5:
                  return ListTile(
                    title: const Text('Electrum Server'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      print('SettingsView: Electrum Server');
                    },
                  );
                case 6:
                  return ListTile(
                    title: const Text('Change PIN'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      print('SettingsView: Change PIN');
                    },
                  );
                default:
                  return const ListTile(
                    title: Text('Hanled index'),
                  );
              }
            },
            itemCount: 7),
      ),
    );
  }
}
