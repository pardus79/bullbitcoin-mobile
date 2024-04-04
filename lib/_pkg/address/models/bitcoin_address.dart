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
    required int balance,
    required bool spendable,
    required List<String>? labels,
    required String? txId,
    required String? walletId,
  }) = _BitcoinAddress;
  BitcoinAddress._();

  factory BitcoinAddress.fromJson(Map<String, dynamic> json) => _$BitcoinAddressFromJson(json);

  static Future<BitcoinAddress> getLastUnused(BitcoinWallet wallet) async {
    final lastUnused = await wallet.bdkWallet!.getAddress(
      addressIndex: const bdk.AddressIndex.lastUnused(),
    );

    return BitcoinAddress(
        address: lastUnused.address,
        index: lastUnused.index,
        kind: AddressKind.deposit,
        status: AddressStatus.unused,
        type: AddressType.Bitcoin,
        balance: 0,
        spendable: true,
        labels: [],
        txId: '',
        walletId: wallet.id);
  }

  static Future<Address> loadFromNative(dynamic addr, BitcoinWallet wallet) async {
    if (addr is! bdk.AddressInfo) {
      throw TypeError();
    }

    return BitcoinAddress(
        address: addr.address,
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
