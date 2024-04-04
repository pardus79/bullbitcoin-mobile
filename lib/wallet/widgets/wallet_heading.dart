import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<AddrBloc>().add(LoadAddresses(wallet: wallet));
                  context.read<AddrBloc>().add(SyncAddresss(oldAddresses: [], wallet: wallet));
                  GoRouter.of(context).push('/address-list');
                },
                child: const Text('Address'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
