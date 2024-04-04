import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/wallet/models/liquid_wallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lwk_dart/lwk_dart.dart' as lwk;

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

  static Future<LiquidAddress> getLastUnused(LiquidWallet wallet) async {
    final lastUnused = await wallet.lwkWallet!.lastUnusedAddress();

    return LiquidAddress(
        address: lastUnused.standard,
        confidentialAddress: lastUnused.confidential,
        index: lastUnused.index,
        kind: AddressKind.deposit,
        status: AddressStatus.unused,
        type: AddressType.Liquid,
        balance: 0,
        spendable: true,
        labels: [],
        txId: '',
        walletId: wallet.id);
  }

  static Future<Address> loadFromNative(dynamic addr, LiquidWallet wallet) async {
    if (addr is! lwk.Address) {
      throw TypeError();
    }

    return LiquidAddress(
        address: addr.standard,
        confidentialAddress: addr.confidential,
        index: addr.index,
        kind: AddressKind.deposit,
        status: AddressStatus.unused,
        type: AddressType.Bitcoin,
        balance: 0,
        spendable: true,
        labels: [],
        txId: '',
        walletId: wallet.id);
  }
}
