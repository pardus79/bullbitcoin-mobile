import 'package:bb_arch/send/view/send_view.dart';
import 'package:flutter/material.dart';

class SendPage extends StatelessWidget {
  const SendPage({super.key, required this.walletId});

  static String route = '/send';
  final String walletId;

  @override
  Widget build(BuildContext context) {
    return SendView(walletId: walletId);
  }
}
