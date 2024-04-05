import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/address/models/bitcoin_address.dart';
import 'package:bb_arch/_pkg/address/models/liquid_address.dart';
import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/tx/models/bitcoin_tx.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:bb_arch/address/widgets/bitcoin_address_list.dart';
import 'package:bb_arch/address/widgets/liquid_address_list.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/tx/widgets/tx_list.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:bb_arch/wallet/widgets/wallet_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressListView extends StatelessWidget {
  const AddressListView({super.key});

  @override
  Widget build(BuildContext context) {
    final wallet = context.select((WalletBloc cubit) => cubit.state.selectedWallet);
    final addresses = context.select((AddrBloc cubit) => cubit.state.depositAddresses);

    Widget listView;
    if (wallet?.type == WalletType.Bitcoin) {
      listView = BitcoinAddressList(addresses: List<BitcoinAddress>.from(addresses));
    } else if (wallet?.type == WalletType.Liquid) {
      listView = LiquidAddressList(addresses: List<LiquidAddress>.from(addresses));
    } else {
      listView = const Text('Unsupported wallet type');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SegmentedButton<String>(
                segments: const <ButtonSegment<String>>[
                  ButtonSegment<String>(
                    value: 'deposit',
                    label: Text('Deposit'),
                  ),
                  ButtonSegment<String>(
                    value: 'change',
                    label: Text('Change'),
                  ),
                  ButtonSegment<String>(
                    value: 'confidential',
                    label: Text('Confidential'),
                  ),
                ],
                selected: const <String>{'deposit'},
                onSelectionChanged: (Set<String> newSelection) {
                  print('onSelectionChanged: $newSelection');
                },
              ),
              listView,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Load Tx', heroTag: 'loadTx', onPressed: () {}, child: const Icon(Icons.front_loader)),
    );
  }
}
