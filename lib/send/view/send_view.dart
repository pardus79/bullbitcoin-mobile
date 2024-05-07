// ignore_for_file: avoid_print

import 'package:bb_arch/_ui/bb_page.dart';
import 'package:flutter/material.dart';

class SendScaffold extends StatelessWidget {
  const SendScaffold({super.key, required this.walletId});

  final String walletId;

  @override
  Widget build(BuildContext context) {
    return BBScaffold(
        title: 'Send',
        child: SendView(
          walletId: walletId,
        ));
  }
}

class SendView extends StatelessWidget {
  const SendView({super.key, required this.walletId});

  final String walletId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Address'),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Amount'),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print("Send :: Send btn clicked");
                },
                child: const Text("Send"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
