import 'package:bb_arch/_pkg/seed/seed_repository.dart';
import 'package:bb_arch/wallet-setup/cubit/wallet_recover_page_cubit.dart';
import 'package:bb_arch/wallet-setup/view/wallet_recover_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletRecoverPage extends StatelessWidget {
  const WalletRecoverPage({super.key});

  static String route = '/wallet/0/setup/recover';

  @override
  Widget build(BuildContext context) {
    final seedRepository = RepositoryProvider.of<SeedRepository>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WalletRecoverPageCubit(seedRepository: seedRepository)),
      ],
      child: const WalletRecoverScaffold(),
    );
  }
}
