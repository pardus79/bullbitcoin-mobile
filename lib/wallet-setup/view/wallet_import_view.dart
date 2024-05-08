// ignore_for_file: avoid_print

import 'package:bb_arch/_ui/atoms/under_construction.dart';
import 'package:bb_arch/_ui/bb_page.dart';
import 'package:flutter/material.dart';

class WalletImportScaffold extends StatelessWidget {
  const WalletImportScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const BBScaffold(title: 'Wallet Import', child: WalletImportView());
  }
}

class WalletImportView extends StatelessWidget {
  const WalletImportView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UnderConstruction(),
            const SizedBox(
              height: 20,
            ),
            const Text('xPub or descriptor'),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 4,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Wallet name'),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print("Wallet recover :: Recover btn clicked");
                },
                child: const Text("Import"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
