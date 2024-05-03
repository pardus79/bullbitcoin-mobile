import 'package:bb_arch/_pkg/address/address_repository.dart';
import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/tx/tx_repository.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:bb_arch/address/bloc/addr_state.dart';
import 'package:bb_arch/address/bloc/address_cubit.dart';
import 'package:bb_arch/address/view/addr_list_view.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/tx/bloc/tx_state.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// context.read<AddressBloc>().add(LoadAddresses(wallet: wallet));
//context.read<AddressBloc>().add(SyncAddresss(txs: txs, oldAddresses: [], wallet: wallet));
class AddressListPage extends StatelessWidget {
  const AddressListPage({super.key, required this.walletId});

  final String walletId;

  @override
  Widget build(BuildContext context) {
    final addressRepository = context.read<AddressRepository>();
    final txRepository = context.read<TxRepository>();
    final selectedWallet =
        context.select((WalletBloc cubit) => cubit.state.wallets.firstWhere((w) => w.id == walletId));
    // final txs = context.select((TxBloc cubit) => cubit.state.txs);

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AddressCubit()),
          BlocProvider(create: (_) => TxBloc(txRepository: txRepository)..add(LoadTxs(wallet: selectedWallet))),
          BlocProvider(create: (_) => AddressBloc(addrRepository: addressRepository)),
        ],
        child: BlocBuilder<TxBloc, TxState>(
            buildWhen: (previous, current) => current.txs.isNotEmpty, // TODO: Update this later
            builder: (context, state) {
              context.read<AddressBloc>().add(LoadAddresses(walletId: selectedWallet.id));
              context.read<AddressBloc>().add(SyncAddresss(txs: state.txs, oldAddresses: [], wallet: selectedWallet));
              return AddressListView();
            }));
  }

/*
  @override
  Widget build(BuildContext context) {
    final loading = context.select((AddressBloc cubit) => cubit.state.status == LoadStatus.loading);

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
  */
}
