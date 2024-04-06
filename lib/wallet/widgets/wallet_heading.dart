import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
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
                  // TODO:
                  // All `push` creates a child of MaterialApp
                  // So the widget tree looks like this
                  //  AppView
                  //    MaterialApp
                  //      HomePage
                  //      WalletPage
                  //      AddressPage (So AddrBloc initalized with WalletPage is not accessible to AddressPage, since they are now siblings)
                  // rather than
                  //  AppView
                  //    MaterialApp
                  //      HomePage
                  //        WalletPage
                  //          AddressPage (So AddrBloc initalized with WalletPage is accessible to AddressPage)
                  // TODO: Need to find a way to nest widgets via Routing.
                  // For now, moving AddrBloc to AppView to test out Address functionality
                  context.read<AddressBloc>().add(LoadAddresses(wallet: wallet));
                  context.read<AddressBloc>().add(SyncAddresss(txs: txs, oldAddresses: [], wallet: wallet));
                  GoRouter.of(context).push('/wallet/address-list');
                },
                child: Text('View Address'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
