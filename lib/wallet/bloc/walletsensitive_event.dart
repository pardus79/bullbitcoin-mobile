part of 'walletsensitive_bloc.dart';

class WalletSensitiveEvent {}

class DeriveWalletFromStoredSeed extends WalletSensitiveEvent {
  final Seed seed;
  DeriveWalletFromStoredSeed({required this.seed});
}
