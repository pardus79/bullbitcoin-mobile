import 'package:bb_arch/wallet-setup/view/wallet_import_view.dart';
import 'package:flutter/material.dart';

class WalletImportPage extends StatelessWidget {
  const WalletImportPage({super.key});

  static String route = '/wallet/0/setup/import';

  @override
  Widget build(BuildContext context) {
    return WalletImportView();
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => WalletPageCubit()),
    //     // BlocProvider(create: (_) => AddrBloc(addrRepository: addressRepository)),
    //   ],
    //   child: const WalletView(),
    // );
  }
}
