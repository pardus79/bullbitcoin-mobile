// ignore_for_file: avoid_print, invalid_annotation_target

import 'package:bb_arch/_pkg/address/models/address.dart';
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

// TODO: Update LiquitWallet to manage USDT, based on requirement
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

    try {
      if (w.lwkWallet == null) {
        print('Wallet is not loaded with lwk. Loading it now');
        w = await loadNativeSdk(w);
      }

      print('sync 1');
      await w.lwkWallet?.sync(liquidElectrumUrl);
      print('sync 2');

      String assetIdToPick = w.network == NetworkType.Mainnet ? lwk.lBtcAssetId : lwk.lTestAssetId;

      print('sync 3');
      final balances = await w.lwkWallet?.balance();
      int finalBalance = balances?.where((b) => b.$1 == assetIdToPick).map((e) => e.$2).first ?? 0;
      print('sync 4');

      return w.copyWith(balance: finalBalance, lastSync: DateTime.now());
    } catch (e) {
      print('Error syncing wallet: $e');
      return w;
    }
  }

  @override
  Future<Iterable<Tx>> getTxs(WalletType type) async {
    final txs = await lwkWallet?.txs();
    final txsFutures = txs?.map((t) => Tx.loadFromNative(t, this)) ?? [];

    return Future.wait(txsFutures);
  }

  @override
  Future<Address> getAddress(int index) async {
    final lwkAddress = await lwkWallet?.addressAtIndex(index);
    return Address.loadFromNative(lwkAddress, this);
  }
}
