import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({
    super.key,
    required this.wallet,
    required this.txs,
  });

  final Wallet wallet;
  final List<Tx> txs;

  @override
  Widget build(BuildContext context) {
    final txs = context.select((TxBloc cubit) => cubit.state.txs);

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
                  GoRouter.of(context).push('/wallet/${wallet.id}/address-list');
                },
                child: const Text('View Addresses'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push('/send?walletId=${wallet.id}');
                },
                child: const Text('Send'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push('/receive?walletId=${wallet.id}');
                },
                child: const Text('Receive'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
