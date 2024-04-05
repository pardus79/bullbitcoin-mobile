import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/address/models/bitcoin_address.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BitcoinAddressList extends StatelessWidget {
  const BitcoinAddressList({
    super.key,
    required this.addresses,
  });

  final List<BitcoinAddress> addresses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        BitcoinAddress addr = addresses[index];
        return ListTile(
          title: Text(addr.address),
          subtitle:
              Text('Index: ${addr.index.toString()}, Tx: ${addr.txCount.toString()}, Bal: ${addr.balance.toString()}'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            print('AddressList: addr: $addr');
            context.read<AddrBloc>().add(SelectAddress(address: addr));
            GoRouter.of(context).push('/wallet/address');
          },
        );
      },
      itemCount: addresses.length,
    );
  }
}
