import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddressList extends StatelessWidget {
  const AddressList({
    super.key,
    required this.addresses,
  });

  final List<Address> addresses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Address addr = addresses[index];
        return ListTile(
          title: Text(addr.address),
          subtitle: Text(addr.index.toString()),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            print('AddressList: addr: $addr');
            context.read<AddrBloc>().add(SelectAddress(address: addr));
            // GoRouter.of(context).push('/tx');
          },
        );
      },
      itemCount: addresses.length,
    );
  }
}
