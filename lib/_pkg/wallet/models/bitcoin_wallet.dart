import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet.dart';

part 'bitcoin_wallet.freezed.dart';
part 'bitcoin_wallet.g.dart';

@freezed
class BitcoinWallet extends Wallet with _$BitcoinWallet {
  factory BitcoinWallet({
    required String id,
    required double balance,
    @Default(false) bool backupTested,
    DateTime? lastBackupTested,
  }) = _BitcoinWallet;
  BitcoinWallet._();

  factory BitcoinWallet.fromJson(Map<String, dynamic> json) => _$BitcoinWalletFromJson(json);

  @override
  static Wallet loadFromMnemonic(String mnemonic) {
    return BitcoinWallet(id: 'hi', balance: 200);
  }

  @override
  void loadNativeSdk() {
    print('Loading native sdk for bitcoin wallet');
  }

  @override
  List<Map<String, dynamic>> getTransactions() {
    return [
      {
        'id': '1',
        'amount': 100,
        'date': '2021-01-01',
        'comment': 'btc txn sycned with bdk',
      },
      {
        'id': '2',
        'amount': 300,
        'date': '2021-01-02',
        'comment': 'btc txn sycned with bdk',
      }
    ];
  }

  @override
  void sync(String electrumUrl) {
    print('Syncing with $electrumUrl via bdk');
  }
}
