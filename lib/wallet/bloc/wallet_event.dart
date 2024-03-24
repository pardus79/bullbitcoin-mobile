part of 'wallet_bloc.dart';

class WalletEvent {}

class LoadAllWallets extends WalletEvent {
  LoadAllWallets();
}

class SyncAllWallets extends WalletEvent {
  SyncAllWallets();
}

class SyncWallet extends WalletEvent {
  final String walletId;
  SyncWallet({required this.walletId});
}
