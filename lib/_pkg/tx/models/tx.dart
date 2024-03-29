import 'package:bb_arch/_pkg/tx/models/bitcoin_tx.dart';
import 'package:bb_arch/_pkg/tx/models/liquid_tx.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';

enum TxType { Bitcoin, Liquid, Lightning, Usdt }

extension TxTypeExtension on TxType {
  String get name {
    switch (this) {
      case TxType.Bitcoin:
        return 'Bitcoin';
      case TxType.Liquid:
        return 'Liquid';
      case TxType.Lightning:
        return 'Lightning';
      case TxType.Usdt:
        return 'Usdt';
    }
  }
}

abstract class Tx {
  TxType type = TxType.Bitcoin;
  int timestamp = 0;
  String id = '';
  int? received;
  int? sent;
  int? fee;
  int? amount;
  int? height;
  String? label;
  String? toAddress;

  String? psbt;
  int? broadcastTime;
  bool? rbfEnabled;

  Map<String, dynamic> toJson();

  static Tx fromJson(Map<String, dynamic> json) {
    if (json.containsKey('type') && json['type'] == TxType.Bitcoin.name) {
      return BitcoinTx.fromJson(json);
    } else if (json.containsKey('type') && json['type'] == TxType.Liquid.name) {
      return LiquidTx.fromJson(json);
    }
    throw UnimplementedError('Unsupported Tx subclass');
  }

  static Future<Tx> loadFromNative(dynamic tx, WalletType type) async {
    if (type == WalletType.Bitcoin) {
      return BitcoinTx.loadFromNative(tx);
    } else if (type == WalletType.Liquid) {
      return LiquidTx.loadFromNative(tx);
    }
    throw UnimplementedError('Unsupported Tx subclass');
  }
}
