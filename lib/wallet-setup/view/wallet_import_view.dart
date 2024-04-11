// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class WalletImportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Wallet Import'),
        ),
        body: const Column(
          children: [Text('Wallet import')],
        ));
  }
}
