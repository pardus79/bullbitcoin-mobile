import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'liquid_address.freezed.dart';
part 'liquid_address.g.dart';

// TODO: Update LiquitAddress, based on requirement
@freezed
class LiquidAddress extends Address with _$LiquidAddress {
  factory LiquidAddress({
    required String address,
    required String confidentialAddress,
    required int index,
    required AddressKind kind,
    required AddressStatus status,
    required AddressType type,
    required int balance,
    required bool spendable,
    required List<String>? labels,
    required String? txId,
    required String? walletId,
  }) = _LiquidAddress;
  LiquidAddress._();

  factory LiquidAddress.fromJson(Map<String, dynamic> json) => _$LiquidAddressFromJson(json);
}
