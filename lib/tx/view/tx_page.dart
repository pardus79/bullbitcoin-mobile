import 'package:bb_arch/_pkg/tx/models/liquid_tx.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/tx/tx_repository.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/tx/cubit/tx_page_cubit.dart';
import 'package:bb_arch/tx/view/bitcoin_tx_view.dart';
import 'package:bb_arch/tx/view/liquid_tx_view.dart';
import 'package:bb_arch/wallet/cubit/wallet_page_cubit.dart';
import 'package:bb_arch/wallet/view/wallet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TxPage extends StatelessWidget {
  const TxPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tx = context.select((TxBloc cubit) => cubit.state.selectedTx);

    Widget txView;

    if (tx?.type == TxType.Bitcoin) {
      txView = const BitcoinTxView();
    } else if (tx?.type == TxType.Liquid) {
      txView = const LiquidTxView();
    } else {
      txView = const Text('Unsupported Tx type');
    }

    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => TxPageCubit()),
    ], child: txView);
  }
}
