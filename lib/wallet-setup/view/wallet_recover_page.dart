import 'package:bb_arch/wallet-setup/view/wallet_recover_view.dart';
import 'package:flutter/material.dart';

class WalletRecoverPage extends StatelessWidget {
  const WalletRecoverPage({super.key});

  static String route = '/wallet/setup/recover';

  @override
  Widget build(BuildContext context) {
    return WalletRecoverView();
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => WalletPageCubit()),
    //     // BlocProvider(create: (_) => AddrBloc(addrRepository: addressRepository)),
    //   ],
    //   child: const WalletView(),
    // );
  }
}
