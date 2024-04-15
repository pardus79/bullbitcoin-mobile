part of 'walletsensitive_bloc.dart';

class WalletSensitiveEvent {}

class DeriveWalletFromStoredSeed extends WalletSensitiveEvent {
  final Seed seed;
  final String walletName;
  DeriveWalletFromStoredSeed({required this.seed, required this.walletName});
}

class PersistAndClearSeed extends WalletSensitiveEvent {}
