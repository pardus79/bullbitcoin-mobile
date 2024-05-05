part of 'walletsensitive_bloc.dart';

class WalletSensitiveEvent {}

class DeriveWalletFromStoredSeed extends WalletSensitiveEvent {
  final Seed seed;
  final String walletName;
  DeriveWalletFromStoredSeed({required this.seed, required this.walletName});
}

class CreateNewSeed extends WalletSensitiveEvent {}

class PersistSeed extends WalletSensitiveEvent {}
