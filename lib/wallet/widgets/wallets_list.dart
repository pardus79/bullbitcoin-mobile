import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WalletList extends StatelessWidget {
  const WalletList({
    super.key,
    required this.wallets,
    required this.syncStatus,
  });

  final List<Wallet> wallets;
  final List<LoadStatus> syncStatus;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return WalletListItem(wallet: wallets[index], syncStatus: syncStatus[index]);
      },
      itemCount: wallets.length,
    );
  }
}

class WalletListItem extends StatelessWidget {
  const WalletListItem({
    super.key,
    required this.wallet,
    required this.syncStatus,
  });

  final Wallet wallet;
  final LoadStatus syncStatus;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${wallet.type.name}: ${wallet.network.name}'),
      subtitle: Text(wallet.balance.toString()),
      leading: syncStatus.name == 'loading'
          ? const CircularProgressIndicator()
          : syncStatus.name == 'initial'
              ? const Icon(Icons.hourglass_empty)
              : const Icon(Icons.check),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Wallet w = wallet;
        context.read<WalletBloc>().add(SelectWallet(wallet: w));
        GoRouter.of(context).push('/wallet');
      },
    );
  }
}
