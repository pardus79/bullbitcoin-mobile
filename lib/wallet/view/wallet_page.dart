import 'package:bb_arch/wallet/view/wallet_view.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return const WalletView();
  }
}
