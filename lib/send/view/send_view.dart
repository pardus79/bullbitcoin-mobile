// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class SendView extends StatelessWidget {
  const SendView({super.key, required this.walletId});

  final String walletId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Send'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return ListTile(
                        title: Text('Send from $walletId'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          print('Send from $walletId');
                        },
                      );
                    default:
                      return const ListTile(
                        title: Text('Hanled index'),
                      );
                  }
                },
                itemCount: 1,
              ),

              const SizedBox(height: 20,),
          
              const Text('Address'),
              const SizedBox(height: 10,),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20,),
          
              const Text('Amount'),
              const SizedBox(height: 10,),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 20,),
          
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
      ),
    );
  }
}
