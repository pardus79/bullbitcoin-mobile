// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liquid_tx.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiquidTx _$LiquidTxFromJson(Map<String, dynamic> json) {
  return _LiquidTx.fromJson(json);
}

/// @nodoc
mixin _$LiquidTx {
  String get id => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get fee => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  TxType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiquidTxCopyWith<LiquidTx> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiquidTxCopyWith<$Res> {
  factory $LiquidTxCopyWith(LiquidTx value, $Res Function(LiquidTx) then) =
      _$LiquidTxCopyWithImpl<$Res, LiquidTx>;
  @useResult
  $Res call({String id, int amount, int fee, int timestamp, TxType type});
}

/// @nodoc
class _$LiquidTxCopyWithImpl<$Res, $Val extends LiquidTx>
    implements $LiquidTxCopyWith<$Res> {
  _$LiquidTxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? fee = null,
    Object? timestamp = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TxType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiquidTxImplCopyWith<$Res>
    implements $LiquidTxCopyWith<$Res> {
  factory _$$LiquidTxImplCopyWith(
          _$LiquidTxImpl value, $Res Function(_$LiquidTxImpl) then) =
      __$$LiquidTxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int amount, int fee, int timestamp, TxType type});
}

/// @nodoc
class __$$LiquidTxImplCopyWithImpl<$Res>
    extends _$LiquidTxCopyWithImpl<$Res, _$LiquidTxImpl>
    implements _$$LiquidTxImplCopyWith<$Res> {
  __$$LiquidTxImplCopyWithImpl(
      _$LiquidTxImpl _value, $Res Function(_$LiquidTxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? fee = null,
    Object? timestamp = null,
    Object? type = null,
  }) {
    return _then(_$LiquidTxImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TxType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiquidTxImpl extends _LiquidTx {
  _$LiquidTxImpl(
      {required this.id,
      required this.amount,
      required this.fee,
      required this.timestamp,
      required this.type})
      : super._();

  factory _$LiquidTxImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiquidTxImplFromJson(json);

  @override
  final String id;
  @override
  final int amount;
  @override
  final int fee;
  @override
  final int timestamp;
  @override
  final TxType type;

  @override
  String toString() {
    return 'LiquidTx(id: $id, amount: $amount, fee: $fee, timestamp: $timestamp, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiquidTxImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, amount, fee, timestamp, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiquidTxImplCopyWith<_$LiquidTxImpl> get copyWith =>
      __$$LiquidTxImplCopyWithImpl<_$LiquidTxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiquidTxImplToJson(
      this,
    );
  }
}

abstract class _LiquidTx extends LiquidTx {
  factory _LiquidTx(
      {required final String id,
      required final int amount,
      required final int fee,
      required final int timestamp,
      required final TxType type}) = _$LiquidTxImpl;
  _LiquidTx._() : super._();

  factory _LiquidTx.fromJson(Map<String, dynamic> json) =
      _$LiquidTxImpl.fromJson;

  @override
  String get id;
  @override
  int get amount;
  @override
  int get fee;
  @override
  int get timestamp;
  @override
  TxType get type;
  @override
  @JsonKey(ignore: true)
  _$$LiquidTxImplCopyWith<_$LiquidTxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
