import 'dart:convert';

import 'package:crypto/crypto.dart';

String calculateSha256(String inputString) {
  final bytes = utf8.encode(inputString);
  final digest = sha256.convert(bytes);
  return digest.toString();
}
