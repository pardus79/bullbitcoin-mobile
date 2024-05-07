// ignore_for_file: avoid_print

import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/address/models/bitcoin_address.dart';
import 'package:bb_arch/_pkg/address/models/liquid_address.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/_ui/bb_page.dart';
import 'package:bb_arch/address/bloc/addr_bloc.dart';
import 'package:bb_arch/address/widgets/bitcoin_address_list.dart';
import 'package:bb_arch/address/widgets/liquid_address_list.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressListScaffold extends StatelessWidget {
  const AddressListScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const BBScaffold(title: 'Address list', child: AddressListView());
  }
}

class AddressListView extends StatefulWidget {
  const AddressListView({super.key});

  @override
  State<AddressListView> createState() => _AddressListView();
}

class _AddressListView extends State<AddressListView> {
  AddressKind selectedKind = AddressKind.deposit;

  @override
  Widget build(BuildContext context) {
    final wallet = context.select((WalletBloc bloc) => bloc.state.selectedWallet);
    final depositAddresses = context.select((AddressBloc bloc) => bloc.state.depositAddresses);
    final changeAddresses = context.select((AddressBloc bloc) => bloc.state.changeAddresses);

    print('selectedKind: $selectedKind');

    Widget listView;
    if (wallet?.type == WalletType.Bitcoin) {
      if (selectedKind == AddressKind.deposit) {
        print('loading with deposit addr');
        listView =
            BitcoinAddressList(walletId: wallet?.id ?? '', addresses: List<BitcoinAddress>.from(depositAddresses));
      } else if (selectedKind == AddressKind.change) {
        print('loading with change addr');
        listView =
            BitcoinAddressList(walletId: wallet?.id ?? '', addresses: List<BitcoinAddress>.from(changeAddresses));
      } else {
        listView = const Text('Unsupported address kind');
      }
    } else if (wallet?.type == WalletType.Liquid) {
      listView = LiquidAddressList(walletId: wallet?.id ?? '', addresses: List<LiquidAddress>.from(depositAddresses));
    } else {
      listView = const Text('Unsupported wallet type');
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AddressKindSegment(
              selectedKind: selectedKind,
              onChange: (Set<AddressKind> newValue) {
                setState(() {
                  print('Changing to ${newValue.first}');
                  selectedKind = newValue.first;
                });
              },
            ),
            listView,
          ],
        ),
      ),
    );
  }
}

class AddressKindSegment extends StatelessWidget {
  const AddressKindSegment({
    super.key,
    this.selectedKind,
    this.onChange,
  });

  final AddressKind? selectedKind;
  final void Function(Set<AddressKind>)? onChange;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<AddressKind>(
      multiSelectionEnabled: false,
      segments: const <ButtonSegment<AddressKind>>[
        ButtonSegment<AddressKind>(
          value: AddressKind.deposit,
          label: Text('Deposit'),
        ),
        ButtonSegment<AddressKind>(
          value: AddressKind.change,
          label: Text('Change'),
        ),
        // ButtonSegment<AddressKind>(
        //   value: AddressKind.confidential,
        //   label: Text('Confidential'),
        // ),
      ],
      selected: {selectedKind ?? AddressKind.deposit},
      onSelectionChanged: onChange ?? (_) {},
    );
  }
}
