part of 'tx_bloc.dart';

class TxEvent {}

class LoadTxs extends TxEvent {
  final Wallet wallet;
  LoadTxs({required this.wallet});
}

class SyncTxs extends TxEvent {
  final Wallet wallet;
  SyncTxs({required this.wallet});
}

class SelectTx extends TxEvent {
  final Tx tx;
  SelectTx({required this.tx});
}

class LoadTx extends TxEvent {
  final String walletId;
  final String txid;
  LoadTx({required this.walletId, required this.txid});
}
