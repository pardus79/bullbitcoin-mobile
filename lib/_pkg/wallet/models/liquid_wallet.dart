import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet.dart';

part 'liquid_wallet.freezed.dart';
part 'liquid_wallet.g.dart';

@freezed
class LiquidWallet extends Wallet with _$LiquidWallet {
  factory LiquidWallet({
    required String id,
    required int balance,
    required WalletType type,
    required NetworkType network,
    @Default(false) bool backupTested,
    DateTime? lastBackupTested,
    @Default('') String mnemonic,
  }) = _LiquidWallet;
  LiquidWallet._();

  factory LiquidWallet.fromJson(Map<String, dynamic> json) => _$LiquidWalletFromJson(json);

  @override
  void loadNativeSdk() {
    print('Loading native sdk for bitcoin wallet');
  }

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

  @override
  Future<void> sync() async {
    print('Syncing via lwk-dart');
  }
}
