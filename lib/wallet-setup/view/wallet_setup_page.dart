import 'package:bb_arch/wallet-setup/view/wallet_setup_view.dart';
import 'package:flutter/material.dart';

class WalletSetupPage extends StatelessWidget {
  const WalletSetupPage({super.key});

  static String route = '/wallet/setup';

  @override
  Widget build(BuildContext context) {
    return WalletSetupView();
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => WalletPageCubit()),
    //     // BlocProvider(create: (_) => AddrBloc(addrRepository: addressRepository)),
    //   ],
    //   child: const WalletView(),
    // );
  }
}
