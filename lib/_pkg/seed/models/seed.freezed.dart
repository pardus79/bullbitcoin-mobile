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
  String get passphrase => throw _privateConstructorUsedError;
  @Index()
  String get fingerprint => throw _privateConstructorUsedError;
  @Enumerated(EnumType.ordinal)
  WalletType get walletType =>
      throw _privateConstructorUsedError; // TODO: Needed here?
  @Enumerated(EnumType.ordinal)
  NetworkType get network => throw _privateConstructorUsedError;

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
      String passphrase,
      @Index() String fingerprint,
      @Enumerated(EnumType.ordinal) WalletType walletType,
      @Enumerated(EnumType.ordinal) NetworkType network});
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
    Object? passphrase = null,
    Object? fingerprint = null,
    Object? walletType = null,
    Object? network = null,
  }) {
    return _then(_value.copyWith(
      mnemonic: null == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String,
      passphrase: null == passphrase
          ? _value.passphrase
          : passphrase // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: null == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as WalletType,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkType,
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
      String passphrase,
      @Index() String fingerprint,
      @Enumerated(EnumType.ordinal) WalletType walletType,
      @Enumerated(EnumType.ordinal) NetworkType network});
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
    Object? passphrase = null,
    Object? fingerprint = null,
    Object? walletType = null,
    Object? network = null,
  }) {
    return _then(_$SeedImpl(
      mnemonic: null == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String,
      passphrase: null == passphrase
          ? _value.passphrase
          : passphrase // ignore: cast_nullable_to_non_nullable
              as String,
      fingerprint: null == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as WalletType,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as NetworkType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeedImpl extends _Seed {
  const _$SeedImpl(
      {required this.mnemonic,
      required this.passphrase,
      @Index() required this.fingerprint,
      @Enumerated(EnumType.ordinal) required this.walletType,
      @Enumerated(EnumType.ordinal) required this.network})
      : super._();

  factory _$SeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeedImplFromJson(json);

  @override
  final String mnemonic;
  @override
  final String passphrase;
  @override
  @Index()
  final String fingerprint;
  @override
  @Enumerated(EnumType.ordinal)
  final WalletType walletType;
// TODO: Needed here?
  @override
  @Enumerated(EnumType.ordinal)
  final NetworkType network;

  @override
  String toString() {
    return 'Seed(mnemonic: $mnemonic, passphrase: $passphrase, fingerprint: $fingerprint, walletType: $walletType, network: $network)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeedImpl &&
            (identical(other.mnemonic, mnemonic) ||
                other.mnemonic == mnemonic) &&
            (identical(other.passphrase, passphrase) ||
                other.passphrase == passphrase) &&
            (identical(other.fingerprint, fingerprint) ||
                other.fingerprint == fingerprint) &&
            (identical(other.walletType, walletType) ||
                other.walletType == walletType) &&
            (identical(other.network, network) || other.network == network));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, mnemonic, passphrase, fingerprint, walletType, network);

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
          required final String passphrase,
          @Index() required final String fingerprint,
          @Enumerated(EnumType.ordinal) required final WalletType walletType,
          @Enumerated(EnumType.ordinal) required final NetworkType network}) =
      _$SeedImpl;
  const _Seed._() : super._();

  factory _Seed.fromJson(Map<String, dynamic> json) = _$SeedImpl.fromJson;

  @override
  String get mnemonic;
  @override
  String get passphrase;
  @override
  @Index()
  String get fingerprint;
  @override
  @Enumerated(EnumType.ordinal)
  WalletType get walletType;
  @override // TODO: Needed here?
  @Enumerated(EnumType.ordinal)
  NetworkType get network;
  @override
  @JsonKey(ignore: true)
  _$$SeedImplCopyWith<_$SeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
