// ignore_for_file: avoid_print, invalid_annotation_target

import 'package:bb_arch/_pkg/constants.dart';
import 'package:bb_arch/_pkg/tx/models/liquid_tx.dart';
import 'package:bb_arch/_pkg/tx/models/tx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lwk_dart/lwk_dart.dart' as lwk;
import 'package:path_provider/path_provider.dart';
import 'wallet.dart';

part 'liquid_wallet.freezed.dart';
part 'liquid_wallet.g.dart';

@freezed
class LiquidWallet extends Wallet with _$LiquidWallet {
  factory LiquidWallet({
    required String id,
    required String name,
    required int balance,
    required WalletType type,
    required NetworkType network,
    @Default(false) bool backupTested,
    DateTime? lastSync,
    DateTime? lastBackupTested,
    @Default('') String mnemonic,
    @JsonKey(includeFromJson: false, includeToJson: false) lwk.Wallet? lwkWallet,
  }) = _LiquidWallet;
  LiquidWallet._();

  factory LiquidWallet.fromJson(Map<String, dynamic> json) => _$LiquidWalletFromJson(json);

  static Future<Wallet> setupNewWallet(String mnemonicStr, NetworkType network, {String name = 'Liquid wallet'}) async {
    return LiquidWallet(
      id: 'hi',
      name: name,
      balance: 0,
      type: WalletType.Liquid,
      network: network,
      mnemonic: mnemonicStr,
    );
  }

  static Future<LiquidWallet> loadNativeSdk(LiquidWallet w) async {
    print('Loading native sdk for liquid wallet');

    final appDocDir = await getApplicationDocumentsDirectory();
    final String dbDir = '${appDocDir.path}/db';

    final lwk.Descriptor descriptor = await lwk.Descriptor.create(
      network: lwk.Network.Testnet,
      mnemonic: w.mnemonic,
    );

    final wallet = await lwk.Wallet.create(
      network: lwk.Network.Testnet,
      dbPath: dbDir,
      descriptor: descriptor.descriptor,
    );

    return w.copyWith(lwkWallet: wallet);
  }

  /*
  @override
  List<Map<String, dynamic>> getTransactions() {
    return [
      {
        'id': 'l1',
        'amount': 1000,
        'date': '2022-01-01',
        'comment': 'liquid txn sycned with lwk-dart',
      },
      {
        'id': 'l2',
        'amount': 3000,
        'date': '2022-01-02',
        'comment': 'liquid txn sycned with lwk-dart',
      }
    ];
  }
  */

  static Future<Wallet> syncWallet(LiquidWallet w) async {
    print('Syncing via lwk');

    if (w.lwkWallet == null) {
      print('Wallet is not loaded with bdk. Loading it now');
      w = await loadNativeSdk(w);
    }

    await w.lwkWallet?.sync(liquidElectrumUrl);

    final bal = await w.lwkWallet?.balance();
    final balance = bal?.lbtc ?? 0;
    print('balance is $balance');

    return w.copyWith(balance: balance, lastSync: DateTime.now());
  }

  @override
  Future<Iterable<Tx>> getTransactions(WalletType type) async {
    final txs = await lwkWallet?.txs();
    final txsFutures = txs?.map((t) => Tx.loadFromNative(t, type)) ?? [];

    return Future.wait(txsFutures);
  }
}
