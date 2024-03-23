import 'package:bb_arch/_pkg/err.dart';
import 'package:bb_arch/_pkg/storage/storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveStorage implements IStorage {
  HiveStorage();

  late Box<String>? _box;

  Future init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    // final password = Hive.generateSecureKey();
    final password = [
      195,
      180,
      43,
      192,
      157,
      140,
      148,
      89,
      179,
      141,
      157,
      57,
      37,
      236,
      120,
      155,
      241,
      105,
      169,
      179,
      238,
      57,
      158,
      22,
      253,
      99,
      1,
      59,
      227,
      116,
      235,
      57
    ];

    final cipher = HiveAesCipher(password);
    _box = await Hive.openBox('store', encryptionCipher: cipher);
  }

  @override
  Future<Err?> deleteAll() async {
    try {
      await _box!.clear();
      return null;
    } catch (e) {
      return Err(e.toString());
    }
  }

  @override
  Future<Err?> deleteValue(String key) async {
    try {
      await _box!.delete(key);
      return null;
    } catch (e) {
      return Err(e.toString());
    }
  }

  @override
  Future<(Map<String, String>?, Err?)> getAll(String s) async {
    try {
      final Map<String, String> data = {};
      _box!.toMap().forEach((key, value) {
        data[key as String] = value;
      });
      return (data, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  @override
  Future<(String?, Err?)> getValue(String key) async {
    try {
      final value = _box!.get(key);
      if (value == null) throw 'No Key';
      return (value, null);
    } catch (e) {
      return (null, Err(e.toString(), expected: e == 'No Key'));
    }
  }

  @override
  Future<Err?> saveValue({required String key, required String value}) async {
    try {
      await _box!.put(key, value);
      return null;
    } catch (e) {
      return Err(e.toString());
    }
  }
}
