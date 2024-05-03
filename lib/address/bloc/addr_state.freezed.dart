// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addr_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressState {
  LoadStatus get status => throw _privateConstructorUsedError;
  Wallet? get selectedWallet => throw _privateConstructorUsedError;
  List<Address> get depositAddresses => throw _privateConstructorUsedError;
  List<Address> get changeAddresses => throw _privateConstructorUsedError;
  Address? get selectedAddress => throw _privateConstructorUsedError;
  AddressKind get selectedAddressKind => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressStateCopyWith<AddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressStateCopyWith<$Res> {
  factory $AddressStateCopyWith(
          AddressState value, $Res Function(AddressState) then) =
      _$AddressStateCopyWithImpl<$Res, AddressState>;
  @useResult
  $Res call(
      {LoadStatus status,
      Wallet? selectedWallet,
      List<Address> depositAddresses,
      List<Address> changeAddresses,
      Address? selectedAddress,
      AddressKind selectedAddressKind,
      String error});
}

/// @nodoc
class _$AddressStateCopyWithImpl<$Res, $Val extends AddressState>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedWallet = freezed,
    Object? depositAddresses = null,
    Object? changeAddresses = null,
    Object? selectedAddress = freezed,
    Object? selectedAddressKind = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      selectedWallet: freezed == selectedWallet
          ? _value.selectedWallet
          : selectedWallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      depositAddresses: null == depositAddresses
          ? _value.depositAddresses
          : depositAddresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      changeAddresses: null == changeAddresses
          ? _value.changeAddresses
          : changeAddresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      selectedAddressKind: null == selectedAddressKind
          ? _value.selectedAddressKind
          : selectedAddressKind // ignore: cast_nullable_to_non_nullable
              as AddressKind,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressStateImplCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
  factory _$$AddressStateImplCopyWith(
          _$AddressStateImpl value, $Res Function(_$AddressStateImpl) then) =
      __$$AddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadStatus status,
      Wallet? selectedWallet,
      List<Address> depositAddresses,
      List<Address> changeAddresses,
      Address? selectedAddress,
      AddressKind selectedAddressKind,
      String error});
}

/// @nodoc
class __$$AddressStateImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressStateImpl>
    implements _$$AddressStateImplCopyWith<$Res> {
  __$$AddressStateImplCopyWithImpl(
      _$AddressStateImpl _value, $Res Function(_$AddressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedWallet = freezed,
    Object? depositAddresses = null,
    Object? changeAddresses = null,
    Object? selectedAddress = freezed,
    Object? selectedAddressKind = null,
    Object? error = null,
  }) {
    return _then(_$AddressStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      selectedWallet: freezed == selectedWallet
          ? _value.selectedWallet
          : selectedWallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      depositAddresses: null == depositAddresses
          ? _value._depositAddresses
          : depositAddresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      changeAddresses: null == changeAddresses
          ? _value._changeAddresses
          : changeAddresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      selectedAddressKind: null == selectedAddressKind
          ? _value.selectedAddressKind
          : selectedAddressKind // ignore: cast_nullable_to_non_nullable
              as AddressKind,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddressStateImpl implements _AddressState {
  const _$AddressStateImpl(
      {this.status = LoadStatus.initial,
      this.selectedWallet = null,
      final List<Address> depositAddresses = const [],
      final List<Address> changeAddresses = const [],
      this.selectedAddress = null,
      this.selectedAddressKind = AddressKind.deposit,
      this.error = ''})
      : _depositAddresses = depositAddresses,
        _changeAddresses = changeAddresses;

  @override
  @JsonKey()
  final LoadStatus status;
  @override
  @JsonKey()
  final Wallet? selectedWallet;
  final List<Address> _depositAddresses;
  @override
  @JsonKey()
  List<Address> get depositAddresses {
    if (_depositAddresses is EqualUnmodifiableListView)
      return _depositAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_depositAddresses);
  }

  final List<Address> _changeAddresses;
  @override
  @JsonKey()
  List<Address> get changeAddresses {
    if (_changeAddresses is EqualUnmodifiableListView) return _changeAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_changeAddresses);
  }

  @override
  @JsonKey()
  final Address? selectedAddress;
  @override
  @JsonKey()
  final AddressKind selectedAddressKind;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'AddressState(status: $status, selectedWallet: $selectedWallet, depositAddresses: $depositAddresses, changeAddresses: $changeAddresses, selectedAddress: $selectedAddress, selectedAddressKind: $selectedAddressKind, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.selectedWallet, selectedWallet) ||
                other.selectedWallet == selectedWallet) &&
            const DeepCollectionEquality()
                .equals(other._depositAddresses, _depositAddresses) &&
            const DeepCollectionEquality()
                .equals(other._changeAddresses, _changeAddresses) &&
            (identical(other.selectedAddress, selectedAddress) ||
                other.selectedAddress == selectedAddress) &&
            (identical(other.selectedAddressKind, selectedAddressKind) ||
                other.selectedAddressKind == selectedAddressKind) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      selectedWallet,
      const DeepCollectionEquality().hash(_depositAddresses),
      const DeepCollectionEquality().hash(_changeAddresses),
      selectedAddress,
      selectedAddressKind,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      __$$AddressStateImplCopyWithImpl<_$AddressStateImpl>(this, _$identity);
}

abstract class _AddressState implements AddressState {
  const factory _AddressState(
      {final LoadStatus status,
      final Wallet? selectedWallet,
      final List<Address> depositAddresses,
      final List<Address> changeAddresses,
      final Address? selectedAddress,
      final AddressKind selectedAddressKind,
      final String error}) = _$AddressStateImpl;

  @override
  LoadStatus get status;
  @override
  Wallet? get selectedWallet;
  @override
  List<Address> get depositAddresses;
  @override
  List<Address> get changeAddresses;
  @override
  Address? get selectedAddress;
  @override
  AddressKind get selectedAddressKind;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
