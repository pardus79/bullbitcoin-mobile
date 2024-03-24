part of 'wallet_bloc.dart';

class WalletEvent {}

class ReadAllWallets extends WalletEvent {
  ReadAllWallets();
}

class SyncAllWallets extends WalletEvent {
  SyncAllWallets();
}

class SyncWallet extends WalletEvent {
  final String walletId;
  SyncWallet({required this.walletId});
}
