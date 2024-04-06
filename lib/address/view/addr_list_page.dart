import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:bb_arch/address/view/addr_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loading = context.select((AddrBloc cubit) => cubit.state.status == LoadStatus.loading);

    if (loading) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Address'),
          ),
          body: const Center(child: CircularProgressIndicator()));
    }
    return AddressListView();
  }
}
