import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/wallet/models/bitcoin_wallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bdk_flutter/bdk_flutter.dart' as bdk;

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
    @Default(0) int balance,
    @Default(true) bool spendable,
    @Default([]) List<String>? labels,
    @Default(0) int txCount,
    @Default([]) List<String> txIds,
    @Default([]) List<String> receiveTxIds,
    @Default([]) List<String> sendTxIds,
    required String? walletId,
  }) = _BitcoinAddress;
  BitcoinAddress._();

  factory BitcoinAddress.fromJson(Map<String, dynamic> json) => _$BitcoinAddressFromJson(json);

  static Future<BitcoinAddress> getLastUnused(BitcoinWallet wallet, AddressKind kind) async {
    bdk.AddressInfo lastUnused;

    if (kind == AddressKind.deposit) {
      lastUnused = await wallet.bdkWallet!.getAddress(
        addressIndex: const bdk.AddressIndex.lastUnused(),
      );
    } else {
      lastUnused = await wallet.bdkWallet!.getInternalAddress(
        addressIndex: const bdk.AddressIndex.lastUnused(),
      );
    }

    return BitcoinAddress(
        address: lastUnused.address,
        index: lastUnused.index,
        kind: kind,
        status: AddressStatus.unused,
        type: AddressType.Bitcoin,
        walletId: wallet.id);
  }

  static Future<Address> loadFromNative(dynamic addr, BitcoinWallet wallet, AddressKind kind) async {
    if (addr is! bdk.AddressInfo) {
      throw TypeError();
    }

    return BitcoinAddress(
        address: addr.address,
        index: addr.index,
        kind: kind,
        status: AddressStatus.unused,
        type: AddressType.Bitcoin,
        walletId: wallet.id);
  }
}
