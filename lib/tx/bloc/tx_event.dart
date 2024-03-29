part of 'tx_bloc.dart';

class TxEvent {}

class LoadTxs extends TxEvent {
  final Wallet w;
  LoadTxs({required this.w});
}

class SelectTx extends TxEvent {
  final Tx tx;
  SelectTx({required this.tx});
}
