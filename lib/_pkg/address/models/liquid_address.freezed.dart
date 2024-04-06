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
  String get address =>
      throw _privateConstructorUsedError; // THIS IS CONFIDENTIAL ADDRESS
  String get regularAddress => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  AddressKind get kind => throw _privateConstructorUsedError;
  AddressStatus get status => throw _privateConstructorUsedError;
  AddressType get type => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  bool get spendable => throw _privateConstructorUsedError;
  List<String>? get labels => throw _privateConstructorUsedError;
  int get txCount => throw _privateConstructorUsedError;
  List<String> get txIds => throw _privateConstructorUsedError;
  List<String> get receiveTxIds => throw _privateConstructorUsedError;
  List<String> get sendTxIds => throw _privateConstructorUsedError;
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
      String regularAddress,
      int index,
      AddressKind kind,
      AddressStatus status,
      AddressType type,
      int balance,
      bool spendable,
      List<String>? labels,
      int txCount,
      List<String> txIds,
      List<String> receiveTxIds,
      List<String> sendTxIds,
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
    Object? regularAddress = null,
    Object? index = null,
    Object? kind = null,
    Object? status = null,
    Object? type = null,
    Object? balance = null,
    Object? spendable = null,
    Object? labels = freezed,
    Object? txCount = null,
    Object? txIds = null,
    Object? receiveTxIds = null,
    Object? sendTxIds = null,
    Object? walletId = freezed,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      regularAddress: null == regularAddress
          ? _value.regularAddress
          : regularAddress // ignore: cast_nullable_to_non_nullable
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
      txCount: null == txCount
          ? _value.txCount
          : txCount // ignore: cast_nullable_to_non_nullable
              as int,
      txIds: null == txIds
          ? _value.txIds
          : txIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      receiveTxIds: null == receiveTxIds
          ? _value.receiveTxIds
          : receiveTxIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sendTxIds: null == sendTxIds
          ? _value.sendTxIds
          : sendTxIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      String regularAddress,
      int index,
      AddressKind kind,
      AddressStatus status,
      AddressType type,
      int balance,
      bool spendable,
      List<String>? labels,
      int txCount,
      List<String> txIds,
      List<String> receiveTxIds,
      List<String> sendTxIds,
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
    Object? regularAddress = null,
    Object? index = null,
    Object? kind = null,
    Object? status = null,
    Object? type = null,
    Object? balance = null,
    Object? spendable = null,
    Object? labels = freezed,
    Object? txCount = null,
    Object? txIds = null,
    Object? receiveTxIds = null,
    Object? sendTxIds = null,
    Object? walletId = freezed,
  }) {
    return _then(_$LiquidAddressImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      regularAddress: null == regularAddress
          ? _value.regularAddress
          : regularAddress // ignore: cast_nullable_to_non_nullable
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
      txCount: null == txCount
          ? _value.txCount
          : txCount // ignore: cast_nullable_to_non_nullable
              as int,
      txIds: null == txIds
          ? _value._txIds
          : txIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      receiveTxIds: null == receiveTxIds
          ? _value._receiveTxIds
          : receiveTxIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sendTxIds: null == sendTxIds
          ? _value._sendTxIds
          : sendTxIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      required this.regularAddress,
      required this.index,
      required this.kind,
      required this.status,
      required this.type,
      this.balance = 0,
      this.spendable = true,
      final List<String>? labels = const [],
      this.txCount = 0,
      final List<String> txIds = const [],
      final List<String> receiveTxIds = const [],
      final List<String> sendTxIds = const [],
      required this.walletId})
      : _labels = labels,
        _txIds = txIds,
        _receiveTxIds = receiveTxIds,
        _sendTxIds = sendTxIds,
        super._();

  factory _$LiquidAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiquidAddressImplFromJson(json);

  @override
  final String address;
// THIS IS CONFIDENTIAL ADDRESS
  @override
  final String regularAddress;
  @override
  final int index;
  @override
  final AddressKind kind;
  @override
  final AddressStatus status;
  @override
  final AddressType type;
  @override
  @JsonKey()
  final int balance;
  @override
  @JsonKey()
  final bool spendable;
  final List<String>? _labels;
  @override
  @JsonKey()
  List<String>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int txCount;
  final List<String> _txIds;
  @override
  @JsonKey()
  List<String> get txIds {
    if (_txIds is EqualUnmodifiableListView) return _txIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_txIds);
  }

  final List<String> _receiveTxIds;
  @override
  @JsonKey()
  List<String> get receiveTxIds {
    if (_receiveTxIds is EqualUnmodifiableListView) return _receiveTxIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receiveTxIds);
  }

  final List<String> _sendTxIds;
  @override
  @JsonKey()
  List<String> get sendTxIds {
    if (_sendTxIds is EqualUnmodifiableListView) return _sendTxIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sendTxIds);
  }

  @override
  final String? walletId;

  @override
  String toString() {
    return 'LiquidAddress(address: $address, regularAddress: $regularAddress, index: $index, kind: $kind, status: $status, type: $type, balance: $balance, spendable: $spendable, labels: $labels, txCount: $txCount, txIds: $txIds, receiveTxIds: $receiveTxIds, sendTxIds: $sendTxIds, walletId: $walletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiquidAddressImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.regularAddress, regularAddress) ||
                other.regularAddress == regularAddress) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.spendable, spendable) ||
                other.spendable == spendable) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.txCount, txCount) || other.txCount == txCount) &&
            const DeepCollectionEquality().equals(other._txIds, _txIds) &&
            const DeepCollectionEquality()
                .equals(other._receiveTxIds, _receiveTxIds) &&
            const DeepCollectionEquality()
                .equals(other._sendTxIds, _sendTxIds) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      regularAddress,
      index,
      kind,
      status,
      type,
      balance,
      spendable,
      const DeepCollectionEquality().hash(_labels),
      txCount,
      const DeepCollectionEquality().hash(_txIds),
      const DeepCollectionEquality().hash(_receiveTxIds),
      const DeepCollectionEquality().hash(_sendTxIds),
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
      required final String regularAddress,
      required final int index,
      required final AddressKind kind,
      required final AddressStatus status,
      required final AddressType type,
      final int balance,
      final bool spendable,
      final List<String>? labels,
      final int txCount,
      final List<String> txIds,
      final List<String> receiveTxIds,
      final List<String> sendTxIds,
      required final String? walletId}) = _$LiquidAddressImpl;
  _LiquidAddress._() : super._();

  factory _LiquidAddress.fromJson(Map<String, dynamic> json) =
      _$LiquidAddressImpl.fromJson;

  @override
  String get address;
  @override // THIS IS CONFIDENTIAL ADDRESS
  String get regularAddress;
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
  int get txCount;
  @override
  List<String> get txIds;
  @override
  List<String> get receiveTxIds;
  @override
  List<String> get sendTxIds;
  @override
  String? get walletId;
  @override
  @JsonKey(ignore: true)
  _$$LiquidAddressImplCopyWith<_$LiquidAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
