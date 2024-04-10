// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Seed _$SeedFromJson(Map<String, dynamic> json) {
  return _Seed.fromJson(json);
}

/// @nodoc
mixin _$Seed {
  String get mnemonic => throw _privateConstructorUsedError;
  String get mnemonicFingerprint => throw _privateConstructorUsedError;
  WalletType get walletType => throw _privateConstructorUsedError;
  NetworkType get network => throw _privateConstructorUsedError;
  String get passphrase => throw _privateConstructorUsedError;
  String get derivationPath => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeedCopyWith<Seed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeedCopyWith<$Res> {
  factory $SeedCopyWith(Seed value, $Res Function(Seed) then) =
      _$SeedCopyWithImpl<$Res, Seed>;
  @useResult
  $Res call(
      {String mnemonic,
      String mnemonicFingerprint,
      WalletType walletType,
      NetworkType network,
      String passphrase,
      String derivationPath,
      String hash});
}

/// @nodoc
class _$SeedCopyWithImpl<$Res, $Val extends Seed>
    implements $SeedCopyWith<$Res> {
  _$SeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mnemonic = null,
    Object? mnemonicFingerprint = null,
    Object? walletType = null,
    Object? network = null,
    Object? passphrase = null,
    Object? derivationPath = null,
    Object? hash = null,
  }) {
    return _then(_value.copyWith(
      mnemonic: null == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String,
      mnemonicFingerprint: null == mnemonicFingerprint
          ? _value.mnemonicFingerprint
          : mnemonicFingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as WalletType,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkType,
      passphrase: null == passphrase
          ? _value.passphrase
          : passphrase // ignore: cast_nullable_to_non_nullable
              as String,
      derivationPath: null == derivationPath
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeedImplCopyWith<$Res> implements $SeedCopyWith<$Res> {
  factory _$$SeedImplCopyWith(
          _$SeedImpl value, $Res Function(_$SeedImpl) then) =
      __$$SeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mnemonic,
      String mnemonicFingerprint,
      WalletType walletType,
      NetworkType network,
      String passphrase,
      String derivationPath,
      String hash});
}

/// @nodoc
class __$$SeedImplCopyWithImpl<$Res>
    extends _$SeedCopyWithImpl<$Res, _$SeedImpl>
    implements _$$SeedImplCopyWith<$Res> {
  __$$SeedImplCopyWithImpl(_$SeedImpl _value, $Res Function(_$SeedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mnemonic = null,
    Object? mnemonicFingerprint = null,
    Object? walletType = null,
    Object? network = null,
    Object? passphrase = null,
    Object? derivationPath = null,
    Object? hash = null,
  }) {
    return _then(_$SeedImpl(
      mnemonic: null == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String,
      mnemonicFingerprint: null == mnemonicFingerprint
          ? _value.mnemonicFingerprint
          : mnemonicFingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as WalletType,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkType,
      passphrase: null == passphrase
          ? _value.passphrase
          : passphrase // ignore: cast_nullable_to_non_nullable
              as String,
      derivationPath: null == derivationPath
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeedImpl extends _Seed {
  const _$SeedImpl(
      {required this.mnemonic,
      required this.mnemonicFingerprint,
      required this.walletType,
      required this.network,
      required this.passphrase,
      required this.derivationPath,
      required this.hash})
      : super._();

  factory _$SeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeedImplFromJson(json);

  @override
  final String mnemonic;
  @override
  final String mnemonicFingerprint;
  @override
  final WalletType walletType;
  @override
  final NetworkType network;
  @override
  final String passphrase;
  @override
  final String derivationPath;
  @override
  final String hash;

  @override
  String toString() {
    return 'Seed(mnemonic: $mnemonic, mnemonicFingerprint: $mnemonicFingerprint, walletType: $walletType, network: $network, passphrase: $passphrase, derivationPath: $derivationPath, hash: $hash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeedImpl &&
            (identical(other.mnemonic, mnemonic) ||
                other.mnemonic == mnemonic) &&
            (identical(other.mnemonicFingerprint, mnemonicFingerprint) ||
                other.mnemonicFingerprint == mnemonicFingerprint) &&
            (identical(other.walletType, walletType) ||
                other.walletType == walletType) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.passphrase, passphrase) ||
                other.passphrase == passphrase) &&
            (identical(other.derivationPath, derivationPath) ||
                other.derivationPath == derivationPath) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mnemonic, mnemonicFingerprint,
      walletType, network, passphrase, derivationPath, hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeedImplCopyWith<_$SeedImpl> get copyWith =>
      __$$SeedImplCopyWithImpl<_$SeedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeedImplToJson(
      this,
    );
  }
}

abstract class _Seed extends Seed {
  const factory _Seed(
      {required final String mnemonic,
      required final String mnemonicFingerprint,
      required final WalletType walletType,
      required final NetworkType network,
      required final String passphrase,
      required final String derivationPath,
      required final String hash}) = _$SeedImpl;
  const _Seed._() : super._();

  factory _Seed.fromJson(Map<String, dynamic> json) = _$SeedImpl.fromJson;

  @override
  String get mnemonic;
  @override
  String get mnemonicFingerprint;
  @override
  WalletType get walletType;
  @override
  NetworkType get network;
  @override
  String get passphrase;
  @override
  String get derivationPath;
  @override
  String get hash;
  @override
  @JsonKey(ignore: true)
  _$$SeedImplCopyWith<_$SeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
