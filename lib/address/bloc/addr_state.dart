import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/misc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'addr_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    @Default(LoadStatus.initial) LoadStatus status,
    @Default([]) List<Address> depositAddresses,
    @Default(null) Address? selectedAddress,
    @Default('') String error,
  }) = _AddressState;
}
