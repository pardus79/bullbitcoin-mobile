// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liquid_wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiquidWallet _$LiquidWalletFromJson(Map<String, dynamic> json) {
  return _LiquidWallet.fromJson(json);
}

/// @nodoc
mixin _$LiquidWallet {
  String get id => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  bool get backupTested => throw _privateConstructorUsedError;
  DateTime? get lastBackupTested => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiquidWalletCopyWith<LiquidWallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiquidWalletCopyWith<$Res> {
  factory $LiquidWalletCopyWith(
          LiquidWallet value, $Res Function(LiquidWallet) then) =
      _$LiquidWalletCopyWithImpl<$Res, LiquidWallet>;
  @useResult
  $Res call(
      {String id,
      double balance,
      bool backupTested,
      DateTime? lastBackupTested});
}

/// @nodoc
class _$LiquidWalletCopyWithImpl<$Res, $Val extends LiquidWallet>
    implements $LiquidWalletCopyWith<$Res> {
  _$LiquidWalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? balance = null,
    Object? backupTested = null,
    Object? lastBackupTested = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      backupTested: null == backupTested
          ? _value.backupTested
          : backupTested // ignore: cast_nullable_to_non_nullable
              as bool,
      lastBackupTested: freezed == lastBackupTested
          ? _value.lastBackupTested
          : lastBackupTested // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiquidWalletImplCopyWith<$Res>
    implements $LiquidWalletCopyWith<$Res> {
  factory _$$LiquidWalletImplCopyWith(
          _$LiquidWalletImpl value, $Res Function(_$LiquidWalletImpl) then) =
      __$$LiquidWalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double balance,
      bool backupTested,
      DateTime? lastBackupTested});
}

/// @nodoc
class __$$LiquidWalletImplCopyWithImpl<$Res>
    extends _$LiquidWalletCopyWithImpl<$Res, _$LiquidWalletImpl>
    implements _$$LiquidWalletImplCopyWith<$Res> {
  __$$LiquidWalletImplCopyWithImpl(
      _$LiquidWalletImpl _value, $Res Function(_$LiquidWalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? balance = null,
    Object? backupTested = null,
    Object? lastBackupTested = freezed,
  }) {
    return _then(_$LiquidWalletImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      backupTested: null == backupTested
          ? _value.backupTested
          : backupTested // ignore: cast_nullable_to_non_nullable
              as bool,
      lastBackupTested: freezed == lastBackupTested
          ? _value.lastBackupTested
          : lastBackupTested // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiquidWalletImpl extends _LiquidWallet {
  _$LiquidWalletImpl(
      {required this.id,
      required this.balance,
      this.backupTested = false,
      this.lastBackupTested})
      : super._();

  factory _$LiquidWalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiquidWalletImplFromJson(json);

  @override
  final String id;
  @override
  final double balance;
  @override
  @JsonKey()
  final bool backupTested;
  @override
  final DateTime? lastBackupTested;

  @override
  String toString() {
    return 'LiquidWallet(id: $id, balance: $balance, backupTested: $backupTested, lastBackupTested: $lastBackupTested)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiquidWalletImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.backupTested, backupTested) ||
                other.backupTested == backupTested) &&
            (identical(other.lastBackupTested, lastBackupTested) ||
                other.lastBackupTested == lastBackupTested));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, balance, backupTested, lastBackupTested);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiquidWalletImplCopyWith<_$LiquidWalletImpl> get copyWith =>
      __$$LiquidWalletImplCopyWithImpl<_$LiquidWalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiquidWalletImplToJson(
      this,
    );
  }
}

abstract class _LiquidWallet extends LiquidWallet {
  factory _LiquidWallet(
      {required final String id,
      required final double balance,
      final bool backupTested,
      final DateTime? lastBackupTested}) = _$LiquidWalletImpl;
  _LiquidWallet._() : super._();

  factory _LiquidWallet.fromJson(Map<String, dynamic> json) =
      _$LiquidWalletImpl.fromJson;

  @override
  String get id;
  @override
  double get balance;
  @override
  bool get backupTested;
  @override
  DateTime? get lastBackupTested;
  @override
  @JsonKey(ignore: true)
  _$$LiquidWalletImplCopyWith<_$LiquidWalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
