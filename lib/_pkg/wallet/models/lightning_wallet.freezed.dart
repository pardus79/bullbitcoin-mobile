// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lightning_wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LightningWallet _$LightningWalletFromJson(Map<String, dynamic> json) {
  return _LightningWallet.fromJson(json);
}

/// @nodoc
mixin _$LightningWallet {
  String get id => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  bool get backupTested => throw _privateConstructorUsedError;
  DateTime? get lastBackupTested => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LightningWalletCopyWith<LightningWallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightningWalletCopyWith<$Res> {
  factory $LightningWalletCopyWith(
          LightningWallet value, $Res Function(LightningWallet) then) =
      _$LightningWalletCopyWithImpl<$Res, LightningWallet>;
  @useResult
  $Res call(
      {String id,
      double balance,
      bool backupTested,
      DateTime? lastBackupTested});
}

/// @nodoc
class _$LightningWalletCopyWithImpl<$Res, $Val extends LightningWallet>
    implements $LightningWalletCopyWith<$Res> {
  _$LightningWalletCopyWithImpl(this._value, this._then);

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
abstract class _$$LightningWalletImplCopyWith<$Res>
    implements $LightningWalletCopyWith<$Res> {
  factory _$$LightningWalletImplCopyWith(_$LightningWalletImpl value,
          $Res Function(_$LightningWalletImpl) then) =
      __$$LightningWalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double balance,
      bool backupTested,
      DateTime? lastBackupTested});
}

/// @nodoc
class __$$LightningWalletImplCopyWithImpl<$Res>
    extends _$LightningWalletCopyWithImpl<$Res, _$LightningWalletImpl>
    implements _$$LightningWalletImplCopyWith<$Res> {
  __$$LightningWalletImplCopyWithImpl(
      _$LightningWalletImpl _value, $Res Function(_$LightningWalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? balance = null,
    Object? backupTested = null,
    Object? lastBackupTested = freezed,
  }) {
    return _then(_$LightningWalletImpl(
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
class _$LightningWalletImpl extends _LightningWallet {
  _$LightningWalletImpl(
      {required this.id,
      required this.balance,
      this.backupTested = false,
      this.lastBackupTested})
      : super._();

  factory _$LightningWalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightningWalletImplFromJson(json);

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
    return 'LightningWallet(id: $id, balance: $balance, backupTested: $backupTested, lastBackupTested: $lastBackupTested)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightningWalletImpl &&
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
  _$$LightningWalletImplCopyWith<_$LightningWalletImpl> get copyWith =>
      __$$LightningWalletImplCopyWithImpl<_$LightningWalletImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LightningWalletImplToJson(
      this,
    );
  }
}

abstract class _LightningWallet extends LightningWallet {
  factory _LightningWallet(
      {required final String id,
      required final double balance,
      final bool backupTested,
      final DateTime? lastBackupTested}) = _$LightningWalletImpl;
  _LightningWallet._() : super._();

  factory _LightningWallet.fromJson(Map<String, dynamic> json) =
      _$LightningWalletImpl.fromJson;

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
  _$$LightningWalletImplCopyWith<_$LightningWalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
