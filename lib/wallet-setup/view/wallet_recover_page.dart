import 'package:bb_arch/_pkg/seed/seed_repository.dart';
import 'package:bb_arch/_pkg/wallet/wallet_repository.dart';
import 'package:bb_arch/wallet-setup/view/wallet_recover_view.dart';
import 'package:bb_arch/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletRecoverPage extends StatelessWidget {
  const WalletRecoverPage({super.key});

  static String route = '/wallet/0/setup/recover';

  @override
  Widget build(BuildContext context) {
    // final walletRepository = RepositoryProvider.of<WalletRepository>(context);
    // final seedRepository = RepositoryProvider.of<SeedRepository>(context);
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => WalletBloc(walletRepository: walletRepository, seedRepository: seedRepository)),
    //   ],
    //   child: WalletRecoverView(),
    // );
    return const WalletRecoverView();
  }
}
