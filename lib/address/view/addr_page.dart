import 'package:bb_arch/_pkg/address/address_repository.dart';
import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:bb_arch/address/bloc/addr_state.dart';
import 'package:bb_arch/address/bloc/address_cubit.dart';
import 'package:bb_arch/address/view/addr_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key, required this.walletId, required this.id});

  final String walletId;
  final String id;

  @override
  Widget build(BuildContext context) {
    final addressRepository = context.read<AddressRepository>();

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AddressCubit()),
          BlocProvider(
              create: (_) =>
                  AddressBloc(addrRepository: addressRepository)..add(LoadAddress(walletId: walletId, address: id))),
        ],
        child: AddressScaffold(
          walletId: walletId,
        ));
  }
}
