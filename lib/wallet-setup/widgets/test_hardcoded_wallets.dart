import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/wallet-setup/widgets/hardcoded_wallet.dart';
import 'package:flutter/material.dart';

class PikachuWallet extends StatelessWidget {
  const PikachuWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HardcodedWallet(
      mnemonic: 'move decline opera album crisp nice ozone casual gate ozone cycle judge',
      passphrase: 'Pass1234',
      walletName: 'Pikachu',
      walletType: WalletType.Bitcoin,
      walletDisplayName: 'Pikachu wallet',
    );
  }
}

class NarutoWallet extends StatelessWidget {
  const NarutoWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HardcodedWallet(
      mnemonic: 'lumber tackle notice city expand cherry tonight people blue cactus forward scissors',
      passphrase: '',
      walletName: 'Naruto',
      walletType: WalletType.Bitcoin,
      walletDisplayName: 'Naruto wallet',
    );
  }
}

class VegetaWallet extends StatelessWidget {
  const VegetaWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HardcodedWallet(
      mnemonic: 'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial',
      passphrase: '',
      walletName: 'Vegeta',
      walletType: WalletType.Bitcoin,
      walletDisplayName: 'Vegeta wallet',
    );
  }
}

class First24Wallet extends StatelessWidget {
  const First24Wallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HardcodedWallet(
      mnemonic:
          'cave arrest spot bleak song diesel wire bleak wolf stand enhance guess coach below next smoke power school edit crowd photo ordinary pottery train',
      passphrase: '',
      walletName: 'First24',
      walletType: WalletType.Bitcoin,
      walletDisplayName: 'First24 wallet',
    );
  }
}

class VegetaLiquidWallet extends StatelessWidget {
  const VegetaLiquidWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HardcodedWallet(
      mnemonic: 'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial',
      passphrase: '',
      walletName: 'L-Vegeta',
      walletType: WalletType.Liquid,
      walletDisplayName: 'Vegeta Liquid wallet',
    );
  }
}
