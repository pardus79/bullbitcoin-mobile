// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:bb_arch/_pkg/tx/tx_repository.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/tx/bloc/tx_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tx_event.dart';

class TxBloc extends Bloc<TxEvent, TxState> {
  final TxRepository txRepository;

  TxBloc({required this.txRepository}) : super(const TxState()) {
    on<LoadTxs>(_onLoadTxs);
    on<SelectTx>(_onSelectTx);
  }

  void _onLoadTxs(LoadTxs event, Emitter<TxState> emit) async {
    emit(state.copyWith(status: LoadStatus.loading));

    print('_onLoadTxs: ${event.w.name}');

    final (txs, err) = await txRepository.listTxs(event.w);
    if (err != null) {
      emit(state.copyWith(txs: [], status: LoadStatus.failure, error: err.toString()));
      return;
    }
    emit(state.copyWith(txs: txs!, status: LoadStatus.success));
  }

  void _onSelectTx(SelectTx event, Emitter<TxState> emit) async {
    emit(state.copyWith(selectedTx: event.tx));
  }
}
