import 'package:bb_arch/_pkg/tx/models/bitcoin_tx.dart';
import 'package:bb_arch/_pkg/tx/models/liquid_tx.dart';
import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/liquid_wallet.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:isar/isar.dart';

part 'tx.g.dart';

@Collection(ignore: {'copyWith'})
class Tx {
  Id isarId = Isar.autoIncrement;

  @Index()
  String id = '';

  @Enumerated(EnumType.ordinal)
  TxType type = TxType.Bitcoin;

  @Index()
  int timestamp = 0;

  int amount = 0;
  int fee = 0;

  int? height;

  String? psbt;
  int? broadcastTime;
  bool? rbfEnabled;

  int? version;
  int? vsize;
  int? weight;
  int? locktime;

  List<BitcoinTxIn>? inputs;
  List<BitcoinTxOut>? outputs;

  List<LiquidTxIn>? linputs;
  List<LiquidTxOut>? loutputs;

  String? toAddress;

  @Index(type: IndexType.value, caseSensitive: false)
  List<String>? labels;

  @Index()
  String? walletId;

  Map<String, dynamic> toJson() {
    return {};
  }

  static Tx fromJson(Map<String, dynamic> json) {
    if (json.containsKey('type') && json['type'] == TxType.Bitcoin.name) {
      return BitcoinTx.fromJson(json);
    } else if (json.containsKey('type') && json['type'] == TxType.Liquid.name) {
      return LiquidTx.fromJson(json);
    }
    throw UnimplementedError('Unsupported Tx subclass');
  }

  static Future<Tx> loadFromNative(dynamic tx, Wallet w) async {
    if (w.type == WalletType.Bitcoin) {
      return BitcoinTx.loadFromNative(tx, w as BitcoinWallet);
    } else if (w.type == WalletType.Liquid) {
      return LiquidTx.loadFromNative(tx, w as LiquidWallet);
    }
    throw UnimplementedError('Unsupported Tx subclass');
  }
}

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
