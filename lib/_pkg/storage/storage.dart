import 'package:bb_arch/_pkg/err.dart';
import 'package:bb_arch/_pkg/storage/hive.dart';

class StorageKeys {
  static const securityKey = 'securityKey';
  static const seeds = 'seeds';
  static const wallets = 'wallets';
  static const settings = 'settings';
  static const network = 'network';
  static const networkFees = 'networkFees';
  static const currency = 'currency';
  static const lighting = 'lighting';
  static const swapTxSensitive = 'swapTxSensitive';
  static const hiveEncryption = 'hiveEncryptionKey';
  static const version = 'version';
}

abstract class IStorage {
  Future<Err?> saveValue({
    required String key,
    required String value,
  });

  Future<(Map<String, String>?, Err?)> getAll();

  Future<(String?, Err?)> getValue(
    String key,
  );

  Future<Err?> deleteValue(
    String key,
  );

  Future<Err?> deleteAll();
}

Future<HiveStorage> setupStorage() async {
  final hiveStorage = HiveStorage();
  await hiveStorage.init();

  return hiveStorage;
}
