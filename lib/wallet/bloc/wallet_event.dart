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
  final int walletIndex;
  SyncWallet({required this.walletId, required this.walletIndex});
}

class WalletSyncStatusUpdated extends WalletEvent {
  final int walletIndex;
  WalletSyncStatusUpdated({required this.walletIndex});
}

class SelectWallet extends WalletEvent {
  final Wallet wallet;
  SelectWallet({required this.wallet});
}
