import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/tx/tx_repository.dart';
import 'package:bb_arch/tx/bloc/tx_bloc.dart';
import 'package:bb_arch/tx/bloc/tx_state.dart';
import 'package:bb_arch/tx/cubit/tx_page_cubit.dart';
import 'package:bb_arch/tx/view/bitcoin_tx_view.dart';
import 'package:bb_arch/tx/view/liquid_tx_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TxPage extends StatelessWidget {
  const TxPage({super.key, required this.walletId, required this.id});

  final String walletId;
  final String id;

  @override
  Widget build(BuildContext context) {
    final txRepository = context.read<TxRepository>();

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TxPageCubit()),
          BlocProvider(create: (_) => TxBloc(txRepository: txRepository)..add(LoadTx(walletId: walletId, txid: id))),
        ],
        child: BlocBuilder<TxBloc, TxState>(
          builder: (context, state) {
            Widget txView;
            Tx? tx = state.selectedTx;
            if (tx?.type == TxType.Bitcoin) {
              txView = const BitcoinTxView();
            } else if (tx?.type == TxType.Liquid) {
              txView = const LiquidTxView();
            } else {
              txView = const Text('Unsupported Tx type');
            }
            return txView;
          },
        ));
  }
}
