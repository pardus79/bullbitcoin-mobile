import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    @Default('') String error,
  }) = _AddresssState;

  factory AddressState.initial() => const AddressState();
}
