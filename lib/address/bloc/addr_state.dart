import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'addr_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const AddressState._();
  const factory AddressState({
    @Default(LoadStatus.initial) LoadStatus status,
    @Default(null) Wallet? selectedWallet,
    @Default([]) List<Address> depositAddresses,
    @Default([]) List<Address> changeAddresses,
    @Default(null) Address? selectedAddress,
    @Default(AddressKind.deposit) AddressKind selectedAddressKind,
    @Default('') String error,
  }) = _AddressState;

  // TODO: Find this and update in the Address model on sync
  bool isMyAddress(String addr) {
    return depositAddresses.any((a) => a.address == addr) || changeAddresses.any((a) => a.address == addr);
  }
}
