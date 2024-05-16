// Change 1: for each wallet with type as newSeed, change it to secure
//  Change 2: add BaseWalletType as Bitcoin
//  Change 3: add isLiquid to all Txns, Addresses
//  Change 4: Update change address Index
// Change 5: create a new Liquid wallet, based on the Bitcoin wallet
import 'dart:convert';

import 'package:bb_mobile/_model/address.dart';
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
import 'package:bdk_flutter/bdk_flutter.dart' as bdk;

Seed? liquidMainnetSeed;
Seed? liquidTestnetSeed;

Future<void> doMigration0_1to0_2(
  SecureStorage secureStorage,
  HiveStorage hiveStorage,
) async {
  print('Migration: 0.1 to 0.2');

  final (walletIds, walletIdsErr) =
      await hiveStorage.getValue(StorageKeys.wallets);
  if (walletIdsErr != null) throw walletIdsErr;

  final walletIdsJson = jsonDecode(walletIds!)['wallets'] as List<dynamic>;

  final WalletSensitiveStorageRepository walletSensitiveStorageRepository =
      WalletSensitiveStorageRepository(secureStorage: secureStorage);

  for (final walletId in walletIdsJson) {
    print('walletId: $walletId');
    final (jsn, err) = await hiveStorage.getValue(walletId as String);
    if (err != null) throw err;

    Map<String, dynamic> walletObj = jsonDecode(jsn!) as Map<String, dynamic>;

    // Change 1: for each wallet with type as newSeed, change it to secure
    // Change 2: add BaseWalletType as Bitcoin
    walletObj =
        await updateWalletObj(walletObj, walletSensitiveStorageRepository);

    // Change 3: add isLiquid to all Txns, Addresses
    walletObj = await addIsLiquid(walletObj);

    // Change 4: Update change address Index
    walletObj = await updateChangeAddressIndex(walletObj);

    print('Save wallet as:');
    // print(jsonEncode(walletObj));

    // final _ = await hiveStorage.saveValue(
    //   key: walletId,
    //   value: jsonEncode(
    //     walletObj,
    //   ),
    // );
  }

  // Change 4: create a new Liquid wallet, based on the Bitcoin wallet
  // await createLiquidWallet(liquidMainnetSeed, liquidTestnetSeed, hiveStorage);

  // Finally update version number to next version
  // await secureStorage.saveValue(key: StorageKeys.version, value: '0.2');
}

Future<Map<String, dynamic>> updateWalletObj(
  Map<String, dynamic> walletObj,
  WalletSensitiveStorageRepository walletSensitiveStorageRepository,
) async {
  int mainWalletIndex = 0;
  int testWalletIndex = 0;

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

        final mnemonicFingerprint = walletObj['mnemonicFingerprint'] as String;
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

        final mnemonicFingerprint = walletObj['mnemonicFingerprint'] as String;
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
  return walletObj;
}

Future<Map<String, dynamic>> updateChangeAddressIndex(
  Map<String, dynamic> walletObj,
) async {
  int changeAddressCount = 0;
  int depositAddressCount = 0;
  int ivar = 0;
  if (walletObj['myAddressBook'] != null) {
    walletObj['myAddressBook'] = walletObj['myAddressBook']
        .map((addr) => addr as Map<String, dynamic>)
        .map((addr) {
      ivar++;
      // if (addr['index'] == null) {
      //   print(
      //     'change address: ${addr['address']} : ${addr['index']} : ${addr['kind']} $ivar',
      //   );
      // }
      if (addr['kind'] == 'change') {
        changeAddressCount++;
      } else if (addr['kind'] == 'deposit') {
        depositAddressCount++;
      }
      return addr;
    }).toList();
  }

  final Wallet w = Wallet.fromJson(walletObj);
  final WalletsRepository walletRepo = WalletsRepository();
  final bdkCreate = BDKCreate(walletsRepository: walletRepo);
  final (bdkWallet, _) = await bdkCreate.loadPublicBdkWallet(w);

  final myAddressBook = w.myAddressBook.toList();
  final toAdd = [];

  int depositCounter = 0;
  int changeCounter = 0;
  for (int i = 0; i < myAddressBook.length; i++) {
    bdk.AddressInfo nativeAddr;
    String nativeAddrStr;

    if (myAddressBook[i].kind == AddressKind.deposit) {
      nativeAddr = await bdkWallet!.getAddress(
        addressIndex: bdk.AddressIndex.peek(index: depositCounter),
      );
      nativeAddrStr = await nativeAddr.address.asString();
      print(
        'myAddressbook.depost index $i : $depositCounter : ${myAddressBook[i].index} ${nativeAddr.index} (${myAddressBook[i].address.substring(0, 8)}, ${nativeAddrStr.substring(0, 8)})',
      );
      depositCounter++;
    } else {
      nativeAddr = await bdkWallet!.getInternalAddress(
        addressIndex: bdk.AddressIndex.peek(index: changeCounter),
      );
      nativeAddrStr = await nativeAddr.address.asString();
      print(
        'myAddressbook.change index $i : $changeCounter : ${myAddressBook[i].index} ${nativeAddr.index} (${myAddressBook[i].address.substring(0, 8)}, ${nativeAddrStr.substring(0, 8)})',
      );
      changeCounter++;
    }

    final matchIndex =
        myAddressBook.indexWhere((a) => a.address == nativeAddrStr);
    print('matchIndex $matchIndex');
    if (matchIndex != -1) {
      myAddressBook[matchIndex] =
          myAddressBook[matchIndex].copyWith(index: nativeAddr.index);
    }
  }

  print('After patch:');
  for (int i = 0; i < myAddressBook.length; i++) {
    print(
      'myAddressbook[$i] : ${myAddressBook[i].index} ${myAddressBook[i].kind} : (${myAddressBook[i].address.substring(0, 8)})',
    );
  }

  return w.copyWith(myAddressBook: myAddressBook).toJson();
}

Future<Map<String, dynamic>> addIsLiquid(
  Map<String, dynamic> walletObj,
) async {
  walletObj['transactions'] = walletObj['transactions']
      .map((tx) => tx as Map<String, dynamic>)
      .map((tx) => tx..addAll({'isLiquid': false}))
      .toList();

  if (walletObj['myAddressBook'] != null) {
    walletObj['myAddressBook'] = walletObj['myAddressBook']
        .map((addr) => addr as Map<String, dynamic>)
        .map((addr) => addr..addAll({'isLiquid': false}))
        .toList();
  }

  // log(jsonEncode(walletObj['myAddressBook']));

  if (walletObj['externalAddressBook'] != null) {
    walletObj['externalAddressBook'] = walletObj['externalAddressBook']
        .map((addr) => addr as Map<String, dynamic>)
        .map((addr) => addr..addAll({'isLiquid': false}))
        .toList();
  }

  return walletObj;
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
