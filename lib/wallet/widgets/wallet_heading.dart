import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:flutter/material.dart';

class WalletHeading extends StatelessWidget {
  const WalletHeading({
    super.key,
    required this.wallet,
    required this.txs,
  });

  final Wallet wallet;
  final List<Tx> txs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            wallet.id,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${wallet.type.name}: ${wallet.network.name}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Balance: ${wallet.balance}'), // Replace with actual balance variable
              Text('${txs.length} txs'), // Replace with actual transaction count variable
              ElevatedButton(
                onPressed: () {
                  // Sync button action
                },
                child: Text('Sync'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
