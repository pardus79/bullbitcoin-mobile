import 'package:bb_mobile/_pkg/storage/hive.dart';
import 'package:bb_mobile/_pkg/storage/migration0_1to0_2.dart';
import 'package:bb_mobile/_pkg/storage/secure_storage.dart';

Future<void> doMigration(
  String fromVersion,
  String toVersion,
  SecureStorage secureStorage,
  HiveStorage hiveStorage,
) async {
  print('fromVersion $fromVersion; toVersion $toVersion');
  await doMigration0_1to0_2(secureStorage, hiveStorage);
  if (toVersion.startsWith('0.2') && fromVersion.startsWith('0.1')) {
    await doMigration0_1to0_2(secureStorage, hiveStorage);
  } else if (toVersion.startsWith('0.3')) {
    if (fromVersion.startsWith('0.1')) {
      await doMigration0_1to0_2(secureStorage, hiveStorage);
      await doMigration02to03(secureStorage, hiveStorage);
    } else if (fromVersion.startsWith('0.2')) {
      await doMigration02to03(secureStorage, hiveStorage);
    }
  } else if (toVersion.startsWith('0.4')) {
    if (fromVersion.startsWith('0.1')) {
      await doMigration0_1to0_2(secureStorage, hiveStorage);
      await doMigration02to03(secureStorage, hiveStorage);
      await doMigration03to04(secureStorage, hiveStorage);
    } else if (fromVersion.startsWith('0.2')) {
      await doMigration02to03(secureStorage, hiveStorage);
      await doMigration03to04(secureStorage, hiveStorage);
    } else if (fromVersion.startsWith('0.3')) {
      await doMigration03to04(secureStorage, hiveStorage);
    }
  }
}

Future<void> doMigration02to03(
  SecureStorage secureStorage,
  HiveStorage hiveStorage,
) async {
  print('Migration: 0.2 to 0.3');
}

Future<void> doMigration03to04(
  SecureStorage secureStorage,
  HiveStorage hiveStorage,
) async {
  print('Migration: 0.3 to 0.4');
}
