import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BitcoinReceive extends StatelessWidget {
  const BitcoinReceive({super.key, required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: QrImageView(
            data: address,
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        Text(address),

        const SizedBox(
          height: 20,
        ),

        ElevatedButton(
          child: const Text('Check for payment'),
          onPressed: () {
            print('BitcoinReceive :: Check for payment button clicked');
          },
        ),

        const SizedBox(
          height: 10,
        ),

        ElevatedButton(
          child: const Text('Add address label'),
          onPressed: () {
            print('BitcoinReceive :: Add address label button clicked');
          },
        ),

        const SizedBox(
          height: 10,
        ),

        ElevatedButton(
          child: const Text('Request payment'),
          onPressed: () {
            print('BitcoinReceive :: Request payment button clicked');
          },
        ),

        const SizedBox(
          height: 10,
        ),

        ElevatedButton(
          child: const Text('Get new address'),
          onPressed: () {
            print('BitcoinReceive :: Get new address button clicked');
          },
        ),

        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}