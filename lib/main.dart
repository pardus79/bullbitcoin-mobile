import 'package:bb_arch/_pkg/address/address_repository.dart';
import 'package:bb_arch/_pkg/storage/hive.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/tx/tx_repository.dart';
import 'package:bb_arch/_pkg/wallet/wallet_repository.dart';
import 'package:bb_arch/app/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Move this to a Splash loader
  final HiveStorage storage = HiveStorage();
  await storage.init();

  final WalletRepository walletRepository = WalletRepository(storage: storage);
  final TxRepository txRepository = TxRepository(storage: storage);
  final AddressRepository addressRepository = AddressRepository(storage: storage);

  runApp(MyApp(
    storage: storage,
    walletRepository: walletRepository,
    txRepository: txRepository,
    addressRepository: addressRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key,
      required this.storage,
      required this.walletRepository,
      required this.txRepository,
      required this.addressRepository});

  final HiveStorage storage;
  final WalletRepository walletRepository;
  final TxRepository txRepository;
  final AddressRepository addressRepository;

  @override
  Widget build(BuildContext context) {
    return App(
      storage: storage,
      walletRepository: walletRepository,
      txRepository: txRepository,
      addressRepository: addressRepository,
    );
  }
}
