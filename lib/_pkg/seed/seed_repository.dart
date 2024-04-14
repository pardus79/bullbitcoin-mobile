// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bb_arch/_pkg/seed/models/seed.dart';
import 'package:bb_arch/_pkg/storage/hive.dart';

class SeedRepository {
  SeedRepository({required this.storage});

  HiveStorage storage;

  late Seed? seed;

  Future<(Seed?, dynamic)> loadSeed(String fingerprint) async {
    try {
      final (seedsStr, _) = await storage.getValue('seed.$fingerprint');
      Seed seed = Seed.fromJson(jsonDecode(seedsStr!));

      return (seed, null);
    } catch (e) {
      return (null, e);
    }
  }

  Future<dynamic> addSeed(Seed seed) async {
    try {
      final err = await storage.saveValue(key: 'seed.${seed.fingerprint}', value: jsonEncode(seed));
      if (err != null) {
        return err;
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> deleteSeed(Seed seed) async {
    try {
      final err = await storage.deleteValue('seed.${seed.fingerprint}');
      if (err != null) {
        return err;
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }

  // TODO: Think of a better way!
  void holdSeed(Seed _seed) {
    seed = _seed;
  }

  void clearSeed() {
    seed = null;
  }

  Future<dynamic> persistSeed(Seed seed) async {
    try {
      final err = await storage.saveValue(key: 'seed.${seed.fingerprint}', value: jsonEncode(seed.toJson()));
      return err;
    } catch (e) {
      return e;
    }
  }
}
