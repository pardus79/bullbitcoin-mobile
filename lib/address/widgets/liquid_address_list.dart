import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/address/models/liquid_address.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LiquidAddressList extends StatelessWidget {
  const LiquidAddressList({
    super.key,
    required this.addresses,
  });

  final List<LiquidAddress> addresses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        LiquidAddress addr = addresses[index];
        return ListTile(
          title: Text(addr.confidentialAddress),
          subtitle: Text(addr.index.toString()),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            print('AddressList: addr: $addr');
            context.read<AddressBloc>().add(SelectAddress(address: addr));
            // GoRouter.of(context).push('/wallet/address');
          },
        );
      },
      itemCount: addresses.length,
    );
  }
}
