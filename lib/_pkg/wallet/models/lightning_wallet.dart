// ignore_for_file: avoid_print

import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/address/models/bitcoin_address.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'wallet.dart';

part 'lightning_wallet.freezed.dart';
part 'lightning_wallet.g.dart';

@freezed
class LightningWallet extends Wallet with _$LightningWallet {
  factory LightningWallet({
    required String id,
    required int balance,
    @Default(false) bool backupTested,
    DateTime? lastBackupTested,
  }) = _LightningWallet;
  LightningWallet._();

  factory LightningWallet.fromJson(Map<String, dynamic> json) => _$LightningWalletFromJson(json);

  static Future<LightningWallet> loadNativeSdk(LightningWallet w) async {
    print('Loading native sdk for lightning wallet');
    return LightningWallet(id: 'LN', balance: 0);
  }

  @override
  Future<Iterable<Tx>> getTxs(WalletType type) async {
    // final txs = await lwkWallet?.txs();

    return [] as Iterable<Tx>;
  }

  @override
  Future<Address> getAddress(int index, AddressKind kind) async {
    return BitcoinAddress(
        address: 'address',
        index: 0,
        kind: kind,
        status: AddressStatus.unused,
        type: AddressType.Lightning,
        balance: 0,
        spendable: true,
        labels: [],
        walletId: '');
  }
}
