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

extension NetworkTypeExtension on NetworkType {
  lwk.Network get getLwkType {
    switch (this) {
      case NetworkType.Mainnet:
        return lwk.Network.Mainnet;
      case NetworkType.Testnet:
        return lwk.Network.Testnet;
      case NetworkType.Signet:
        return lwk.Network.Testnet;
    }
  }
}

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
      id: name,
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

  static Future<Wallet> syncWallet(LiquidWallet w) async {
    print('Syncing via lwk');

    if (w.lwkWallet == null) {
      print('Wallet is not loaded with bdk. Loading it now');
      w = await loadNativeSdk(w);
    }

    await w.lwkWallet?.sync(liquidElectrumUrl);

    String assetIdToPick = w.network == NetworkType.Mainnet ? lwk.lBtcAssetId : lwk.lTestAssetId;

    final balances = await w.lwkWallet?.balance();
    int finalBalance = balances?.where((b) => b.$1 == assetIdToPick).map((e) => e.$2).first ?? 0;
    // int finalBalance = (await w.lwkWallet?.balance()) as int;

    return w.copyWith(balance: finalBalance, lastSync: DateTime.now());
  }

  @override
  Future<Iterable<Tx>> getTransactions(WalletType type) async {
    final txs = await lwkWallet?.txs();
    final txsFutures = txs?.map((t) => Tx.loadFromNative(t, this)) ?? [];

    return Future.wait(txsFutures);
  }
}
