// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ReceiveView extends StatelessWidget {
  const ReceiveView({super.key, required this.walletId});

  final String walletId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Receive'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return ListTile(
                    title: Text('Receive to $walletId'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      print('Receive to $walletId');
                    },
                  );
                default:
                  return const ListTile(
                    title: Text('Hanled index'),
                  );
              }
            },
            itemCount: 1),
      ),
    );
  }
}
