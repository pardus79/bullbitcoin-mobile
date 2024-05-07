import 'package:bb_arch/wallet-setup/view/wallet_create_view.dart';
import 'package:flutter/material.dart';

class WalletCreatePage extends StatelessWidget {
  const WalletCreatePage({super.key});

  static String route = '/wallet/0/setup/create';

  @override
  Widget build(BuildContext context) {
    return const WalletCreateScaffold();
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => WalletPageCubit()),
    //     // BlocProvider(create: (_) => AddrBloc(addrRepository: addressRepository)),
    //   ],
    //   child: const WalletView(),
    // );
  }
}
