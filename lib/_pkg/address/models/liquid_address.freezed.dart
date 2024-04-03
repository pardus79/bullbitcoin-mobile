// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liquid_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiquidAddress _$LiquidAddressFromJson(Map<String, dynamic> json) {
  return _LiquidAddress.fromJson(json);
}

/// @nodoc
mixin _$LiquidAddress {
  String get address => throw _privateConstructorUsedError;
  String get confidentialAddress => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  AddressKind get kind => throw _privateConstructorUsedError;
  AddressStatus get status => throw _privateConstructorUsedError;
  AddressType get type => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  bool get spendable => throw _privateConstructorUsedError;
  List<String>? get labels => throw _privateConstructorUsedError;
  String? get txId => throw _privateConstructorUsedError;
  String? get walletId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiquidAddressCopyWith<LiquidAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiquidAddressCopyWith<$Res> {
  factory $LiquidAddressCopyWith(
          LiquidAddress value, $Res Function(LiquidAddress) then) =
      _$LiquidAddressCopyWithImpl<$Res, LiquidAddress>;
  @useResult
  $Res call(
      {String address,
      String confidentialAddress,
      int index,
      AddressKind kind,
      AddressStatus status,
      AddressType type,
      int balance,
      bool spendable,
      List<String>? labels,
      String? txId,
      String? walletId});
}

/// @nodoc
class _$LiquidAddressCopyWithImpl<$Res, $Val extends LiquidAddress>
    implements $LiquidAddressCopyWith<$Res> {
  _$LiquidAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? confidentialAddress = null,
    Object? index = null,
    Object? kind = null,
    Object? status = null,
    Object? type = null,
    Object? balance = null,
    Object? spendable = null,
    Object? labels = freezed,
    Object? txId = freezed,
    Object? walletId = freezed,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      confidentialAddress: null == confidentialAddress
          ? _value.confidentialAddress
          : confidentialAddress // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as AddressKind,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AddressStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddressType,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      spendable: null == spendable
          ? _value.spendable
          : spendable // ignore: cast_nullable_to_non_nullable
              as bool,
      labels: freezed == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      txId: freezed == txId
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as String?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiquidAddressImplCopyWith<$Res>
    implements $LiquidAddressCopyWith<$Res> {
  factory _$$LiquidAddressImplCopyWith(
          _$LiquidAddressImpl value, $Res Function(_$LiquidAddressImpl) then) =
      __$$LiquidAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String confidentialAddress,
      int index,
      AddressKind kind,
      AddressStatus status,
      AddressType type,
      int balance,
      bool spendable,
      List<String>? labels,
      String? txId,
      String? walletId});
}

/// @nodoc
class __$$LiquidAddressImplCopyWithImpl<$Res>
    extends _$LiquidAddressCopyWithImpl<$Res, _$LiquidAddressImpl>
    implements _$$LiquidAddressImplCopyWith<$Res> {
  __$$LiquidAddressImplCopyWithImpl(
      _$LiquidAddressImpl _value, $Res Function(_$LiquidAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? confidentialAddress = null,
    Object? index = null,
    Object? kind = null,
    Object? status = null,
    Object? type = null,
    Object? balance = null,
    Object? spendable = null,
    Object? labels = freezed,
    Object? txId = freezed,
    Object? walletId = freezed,
  }) {
    return _then(_$LiquidAddressImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      confidentialAddress: null == confidentialAddress
          ? _value.confidentialAddress
          : confidentialAddress // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as AddressKind,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AddressStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AddressType,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      spendable: null == spendable
          ? _value.spendable
          : spendable // ignore: cast_nullable_to_non_nullable
              as bool,
      labels: freezed == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      txId: freezed == txId
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as String?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiquidAddressImpl extends _LiquidAddress {
  _$LiquidAddressImpl(
      {required this.address,
      required this.confidentialAddress,
      required this.index,
      required this.kind,
      required this.status,
      required this.type,
      required this.balance,
      required this.spendable,
      required final List<String>? labels,
      required this.txId,
      required this.walletId})
      : _labels = labels,
        super._();

  factory _$LiquidAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiquidAddressImplFromJson(json);

  @override
  final String address;
  @override
  final String confidentialAddress;
  @override
  final int index;
  @override
  final AddressKind kind;
  @override
  final AddressStatus status;
  @override
  final AddressType type;
  @override
  final int balance;
  @override
  final bool spendable;
  final List<String>? _labels;
  @override
  List<String>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? txId;
  @override
  final String? walletId;

  @override
  String toString() {
    return 'LiquidAddress(address: $address, confidentialAddress: $confidentialAddress, index: $index, kind: $kind, status: $status, type: $type, balance: $balance, spendable: $spendable, labels: $labels, txId: $txId, walletId: $walletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiquidAddressImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.confidentialAddress, confidentialAddress) ||
                other.confidentialAddress == confidentialAddress) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.spendable, spendable) ||
                other.spendable == spendable) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.txId, txId) || other.txId == txId) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      confidentialAddress,
      index,
      kind,
      status,
      type,
      balance,
      spendable,
      const DeepCollectionEquality().hash(_labels),
      txId,
      walletId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiquidAddressImplCopyWith<_$LiquidAddressImpl> get copyWith =>
      __$$LiquidAddressImplCopyWithImpl<_$LiquidAddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiquidAddressImplToJson(
      this,
    );
  }
}

abstract class _LiquidAddress extends LiquidAddress {
  factory _LiquidAddress(
      {required final String address,
      required final String confidentialAddress,
      required final int index,
      required final AddressKind kind,
      required final AddressStatus status,
      required final AddressType type,
      required final int balance,
      required final bool spendable,
      required final List<String>? labels,
      required final String? txId,
      required final String? walletId}) = _$LiquidAddressImpl;
  _LiquidAddress._() : super._();

  factory _LiquidAddress.fromJson(Map<String, dynamic> json) =
      _$LiquidAddressImpl.fromJson;

  @override
  String get address;
  @override
  String get confidentialAddress;
  @override
  int get index;
  @override
  AddressKind get kind;
  @override
  AddressStatus get status;
  @override
  AddressType get type;
  @override
  int get balance;
  @override
  bool get spendable;
  @override
  List<String>? get labels;
  @override
  String? get txId;
  @override
  String? get walletId;
  @override
  @JsonKey(ignore: true)
  _$$LiquidAddressImplCopyWith<_$LiquidAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
