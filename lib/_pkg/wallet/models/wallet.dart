enum WalletType { Bitcoin, Liquid, Lightning, Usdt }

enum NetworkType { Mainnet, Testnet, Signet }

abstract class Wallet {
  String id = '';
  double balance = 0;
  WalletType type = WalletType.Bitcoin;
  NetworkType network = NetworkType.Mainnet;
  bool backupTested = false;
  bool nativeSdkLoaded = false;
  DateTime? lastBackupTested;

  static Wallet loadFromMnemonic(String mnemonic) {
    throw UnimplementedError();
  }

  void loadNativeSdk();
  WalletType getWalletType() {
    return type;
  }

  List<Map<String, dynamic>> getTransactions();
  void sync(String electrumUrl);

  dynamic toJson();
}

/*
class Wallet {
  String id = '';
  WalletType getWalletType() {
    return WalletType.Bitcoin;
  }

  double getBalance() {
    return 0;
  }

  List<Map<String, dynamic>> getTransactions() {
    return [];
  }

  void sync(String electrumUrl) {}
}
*/
