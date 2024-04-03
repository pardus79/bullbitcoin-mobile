import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bitcoin_address.freezed.dart';
part 'bitcoin_address.g.dart';

@freezed
class BitcoinAddress extends Address with _$BitcoinAddress {
  factory BitcoinAddress({
    required String address,
    required int index,
    required AddressKind kind,
    required AddressStatus status,
    required AddressType type,
    required int balance,
    required bool spendable,
    required List<String>? labels,
    required String? txId,
    required String? walletId,
  }) = _BitcoinAddress;
  BitcoinAddress._();

  factory BitcoinAddress.fromJson(Map<String, dynamic> json) => _$BitcoinAddressFromJson(json);
}
