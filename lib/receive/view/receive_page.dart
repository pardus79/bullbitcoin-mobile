import 'package:bb_arch/receive/view/receive_view.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceivePage extends StatelessWidget {
  const ReceivePage({super.key, required this.walletId});

  static String route = '/receive';
  final String walletId;

  @override
  Widget build(BuildContext context) {

    final wallets = context.select((WalletBloc cubit) => cubit.state.wallets);

    return ReceiveView(
      walletId: walletId,
      wallets: wallets,
    );
  }
}
