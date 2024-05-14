// Change 1: for each wallet with type as newSeed, change it to secure
// Change 2: add BaseWalletType as Bitcoin
// Change 3: create a new Liquid wallet, based on the Bitcoin wallet
import 'dart:convert';
import 'dart:developer';

import 'package:bb_mobile/_model/seed.dart';
import 'package:bb_mobile/_model/wallet.dart';
import 'package:bb_mobile/_pkg/storage/hive.dart';
import 'package:bb_mobile/_pkg/storage/secure_storage.dart';
import 'package:bb_mobile/_pkg/storage/storage.dart';
import 'package:bb_mobile/_pkg/wallet/bdk/create.dart';
import 'package:bb_mobile/_pkg/wallet/bdk/sensitive_create.dart';
import 'package:bb_mobile/_pkg/wallet/create.dart';
import 'package:bb_mobile/_pkg/wallet/lwk/create.dart';
import 'package:bb_mobile/_pkg/wallet/lwk/sensitive_create.dart';
import 'package:bb_mobile/_pkg/wallet/repository/sensitive_storage.dart';
import 'package:bb_mobile/_pkg/wallet/repository/storage.dart';
import 'package:bb_mobile/_pkg/wallet/repository/wallets.dart';

Future<void> doMigration0_1to0_2(
  SecureStorage secureStorage,
  HiveStorage hiveStorage,
) async {
  print('Migration: 0.1 to 0.2');

  // Change 1: for each wallet with type as newSeed, change it to secure
  // Change 2: add BaseWalletType as Bitcoin
  final (walletIds, walletIdsErr) =
      await hiveStorage.getValue(StorageKeys.wallets);
  if (walletIdsErr != null) throw walletIdsErr;

  final walletIdsJson = jsonDecode(walletIds!)['wallets'] as List<dynamic>;

  final WalletSensitiveStorageRepository walletSensitiveStorageRepository =
      WalletSensitiveStorageRepository(secureStorage: secureStorage);

  int mainWalletIndex = 0;
  int testWalletIndex = 0;
  Seed? liquidMainnetSeed;
  Seed? liquidTestnetSeed;
  for (final walletId in walletIdsJson) {
    final (jsn, err) = await hiveStorage.getValue(walletId as String);
    if (err != null) throw err;

    final walletObj = jsonDecode(jsn!) as Map<String, dynamic>;
    // print(walletObj);

    // TODO: Test this assumption
    // Assuming first wallet is to be changed to secure and further wallets to words
    // `newSeed` --> Auto created by wallet
    // `worlds` --> Wallet recovered by user
    if (walletObj['type'] == 'newSeed' || walletObj['type'] == 'words') {
      if (walletObj['network'] == 'Mainnet') {
        if (mainWalletIndex == 0) {
          walletObj['type'] = 'secure';
          walletObj['name'] =
              'Secure Bitcoin Wallet / ' + (walletObj['name'] as String);
          walletObj['mainWallet'] = true;
          mainWalletIndex++;

          final mnemonicFingerprint =
              walletObj['mnemonicFingerprint'] as String;
          final (seed, _) = await walletSensitiveStorageRepository.readSeed(
            fingerprintIndex: mnemonicFingerprint,
          );

          liquidMainnetSeed = seed;
        } else {
          walletObj['type'] = 'words';
          mainWalletIndex++;
        }
      } else if (walletObj['network'] == 'Testnet') {
        if (testWalletIndex == 0) {
          walletObj['type'] = 'secure';
          walletObj['name'] =
              'Secure Bitcoin Wallet / ' + (walletObj['name'] as String);
          walletObj['mainWallet'] = true;
          testWalletIndex++;

          final mnemonicFingerprint =
              walletObj['mnemonicFingerprint'] as String;
          final (seed, _) = await walletSensitiveStorageRepository.readSeed(
            fingerprintIndex: mnemonicFingerprint,
          );

          liquidTestnetSeed = seed;
        } else {
          walletObj['type'] = 'words';
          testWalletIndex++;
        }
      }
    }
    walletObj.addAll({'baseWalletType': 'Bitcoin'});

    // print('Save wallet as:');
    // print(jsonEncode(walletObj));

    final _ = await hiveStorage.saveValue(
      key: walletId,
      value: jsonEncode(
        walletObj,
      ),
    );
  }

  // Change 3: add isLiquid to all Txns, Addresses
  await addIsLiquid(secureStorage, hiveStorage);

  // Change 4: create a new Liquid wallet, based on the Bitcoin wallet
  await createLiquidWallet(liquidMainnetSeed, liquidTestnetSeed, hiveStorage);

  // Finally update version number to next version
  await secureStorage.saveValue(key: StorageKeys.version, value: '0.2');
}

Future<void> createLiquidWallet(
  Seed? liquidMainnetSeed,
  Seed? liquidTestnetSeed,
  HiveStorage hiveStorage,
) async {
  final WalletsRepository walletRep = WalletsRepository();
  final BDKCreate bdkCreate = BDKCreate(walletsRepository: walletRep);
  final BDKSensitiveCreate bdkSensitiveCreate =
      BDKSensitiveCreate(walletsRepository: walletRep, bdkCreate: bdkCreate);
  final LWKCreate lwkCreate = LWKCreate();
  final LWKSensitiveCreate lwkSensitiveCreate = LWKSensitiveCreate(
    bdkSensitiveCreate: bdkSensitiveCreate,
    lwkCreate: lwkCreate,
  );
  final WalletsStorageRepository walletsStorageRepository =
      WalletsStorageRepository(hiveStorage: hiveStorage);
  final WalletCreate walletCreate = WalletCreate(
    walletsRepository: walletRep,
    lwkCreate: lwkCreate,
    bdkCreate: bdkCreate,
    walletsStorageRepository: walletsStorageRepository,
  );

  if (liquidMainnetSeed != null) {
    final (lw, _) = await lwkSensitiveCreate.oneLiquidFromBIP39(
      seed: liquidMainnetSeed,
      passphrase: liquidMainnetSeed.passphrases.isNotEmpty
          ? liquidMainnetSeed.passphrases[0].passphrase
          : '',
      scriptType: ScriptType.bip84,
      walletType: BBWalletType.instant,
      network: BBNetwork.Mainnet,
      walletCreate: walletCreate,
    );
    final liquidWallet =
        lw?.copyWith(name: lw.creationName(), mainWallet: true);
    // print(liquidWallet?.id);
    await walletsStorageRepository.newWallet(liquidWallet!);
  }

  if (liquidTestnetSeed != null) {
    final (lw, _) = await lwkSensitiveCreate.oneLiquidFromBIP39(
      seed: liquidTestnetSeed,
      passphrase: liquidTestnetSeed.passphrases.isNotEmpty
          ? liquidTestnetSeed.passphrases[0].passphrase
          : '',
      scriptType: ScriptType.bip84,
      walletType: BBWalletType.instant,
      network: BBNetwork.Testnet,
      walletCreate: walletCreate,
    );
    final liquidWallet =
        lw?.copyWith(name: lw.creationName(), mainWallet: true);
    // print(liquidWallet?.id);
    await walletsStorageRepository.newWallet(liquidWallet!);
  }
}

Future<void> addIsLiquid(
  SecureStorage secureStorage,
  HiveStorage hiveStorage,
) async {
  final (walletIds, walletIdsErr) =
      await hiveStorage.getValue(StorageKeys.wallets);
  if (walletIdsErr != null) throw walletIdsErr;

  final walletIdsJson = jsonDecode(walletIds!)['wallets'] as List<dynamic>;

  final WalletSensitiveStorageRepository walletSensitiveStorageRepository =
      WalletSensitiveStorageRepository(secureStorage: secureStorage);

  for (final walletId in walletIdsJson) {
    final (jsn, err) = await hiveStorage.getValue(walletId as String);
    if (err != null) throw err;

    final walletObj = jsonDecode(jsn!) as Map<String, dynamic>;
    walletObj['transactions'] = walletObj['transactions']
        .map((tx) => tx as Map<String, dynamic>)
        .map((tx) => tx..addAll({'isLiquid': false}))
        .toList();
    //log(jsonEncode(walletObj['transactions']));

    // log(jsonEncode(walletObj['myAddressBook']));
    if (walletObj['myAddressBook'] != null) {
      walletObj['myAddressBook'] = walletObj['myAddressBook'].map(
        (addr) {
          addr.addAll({'isLiquid': false});
          return addr;
        },
      ).toList();
    }

    if (walletObj['myAddressBook'] != null) {
      walletObj['externalAddressBook'] = walletObj['externalAddressBook']
          .map((addr) => addr as Map<String, dynamic>)
          .map((addr) => addr..addAll({'isLiquid': false}))
          .toList();
    }

    log(jsonEncode(walletObj['myAddressBook']));

    // final _ = await hiveStorage.saveValue(
    //   key: walletId,
    //   value: jsonEncode(
    //     walletObj,
    //   ),
    // );
  }
}
