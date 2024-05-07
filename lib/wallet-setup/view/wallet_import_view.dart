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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
      ),
    );
  }
}
