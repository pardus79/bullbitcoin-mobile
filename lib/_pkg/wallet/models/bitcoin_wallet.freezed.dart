// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bitcoin_wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BitcoinWallet _$BitcoinWalletFromJson(Map<String, dynamic> json) {
  return _BitcoinWallet.fromJson(json);
}

/// @nodoc
mixin _$BitcoinWallet {
  String get id => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  bool get backupTested => throw _privateConstructorUsedError;
  DateTime? get lastBackupTested => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BitcoinWalletCopyWith<BitcoinWallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BitcoinWalletCopyWith<$Res> {
  factory $BitcoinWalletCopyWith(
          BitcoinWallet value, $Res Function(BitcoinWallet) then) =
      _$BitcoinWalletCopyWithImpl<$Res, BitcoinWallet>;
  @useResult
  $Res call(
      {String id,
      double balance,
      bool backupTested,
      DateTime? lastBackupTested});
}

/// @nodoc
class _$BitcoinWalletCopyWithImpl<$Res, $Val extends BitcoinWallet>
    implements $BitcoinWalletCopyWith<$Res> {
  _$BitcoinWalletCopyWithImpl(this._value, this._then);

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
abstract class _$$BitcoinWalletImplCopyWith<$Res>
    implements $BitcoinWalletCopyWith<$Res> {
  factory _$$BitcoinWalletImplCopyWith(
          _$BitcoinWalletImpl value, $Res Function(_$BitcoinWalletImpl) then) =
      __$$BitcoinWalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double balance,
      bool backupTested,
      DateTime? lastBackupTested});
}

/// @nodoc
class __$$BitcoinWalletImplCopyWithImpl<$Res>
    extends _$BitcoinWalletCopyWithImpl<$Res, _$BitcoinWalletImpl>
    implements _$$BitcoinWalletImplCopyWith<$Res> {
  __$$BitcoinWalletImplCopyWithImpl(
      _$BitcoinWalletImpl _value, $Res Function(_$BitcoinWalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? balance = null,
    Object? backupTested = null,
    Object? lastBackupTested = freezed,
  }) {
    return _then(_$BitcoinWalletImpl(
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
class _$BitcoinWalletImpl extends _BitcoinWallet {
  _$BitcoinWalletImpl(
      {required this.id,
      required this.balance,
      this.backupTested = false,
      this.lastBackupTested})
      : super._();

  factory _$BitcoinWalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$BitcoinWalletImplFromJson(json);

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
    return 'BitcoinWallet(id: $id, balance: $balance, backupTested: $backupTested, lastBackupTested: $lastBackupTested)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BitcoinWalletImpl &&
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
  _$$BitcoinWalletImplCopyWith<_$BitcoinWalletImpl> get copyWith =>
      __$$BitcoinWalletImplCopyWithImpl<_$BitcoinWalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BitcoinWalletImplToJson(
      this,
    );
  }
}

abstract class _BitcoinWallet extends BitcoinWallet {
  factory _BitcoinWallet(
      {required final String id,
      required final double balance,
      final bool backupTested,
      final DateTime? lastBackupTested}) = _$BitcoinWalletImpl;
  _BitcoinWallet._() : super._();

  factory _BitcoinWallet.fromJson(Map<String, dynamic> json) =
      _$BitcoinWalletImpl.fromJson;

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
  _$$BitcoinWalletImplCopyWith<_$BitcoinWalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
