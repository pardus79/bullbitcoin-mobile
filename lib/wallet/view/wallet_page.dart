import 'package:bb_arch/_pkg/address/address_repository.dart';
import 'package:bb_arch/_pkg/tx/tx_repository.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/wallet/cubit/wallet_page_cubit.dart';
import 'package:bb_arch/wallet/view/wallet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final txRepository = context.read<TxRepository>();
    // final addressRepository = context.read<AddressRepository>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WalletPageCubit()),
        // BlocProvider(create: (_) => AddrBloc(addrRepository: addressRepository)),
      ],
      child: const WalletView(),
    );
  }
}
