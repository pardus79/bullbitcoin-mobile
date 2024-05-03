import 'package:bb_arch/receive/view/receive_view.dart';
import 'package:flutter/material.dart';

class ReceivePage extends StatelessWidget {
  const ReceivePage({super.key, required this.walletId});

  static String route = '/receive';
  final String walletId;

  @override
  Widget build(BuildContext context) {
    return ReceiveView(walletId: walletId);
  }
}
