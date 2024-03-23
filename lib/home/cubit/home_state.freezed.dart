// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  WalletStatus get status => throw _privateConstructorUsedError;
  List<WalletStatus> get syncWalletStatus => throw _privateConstructorUsedError;
  List<Wallet> get wallets => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {WalletStatus status,
      List<WalletStatus> syncWalletStatus,
      List<Wallet> wallets,
      String error});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? syncWalletStatus = null,
    Object? wallets = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WalletStatus,
      syncWalletStatus: null == syncWalletStatus
          ? _value.syncWalletStatus
          : syncWalletStatus // ignore: cast_nullable_to_non_nullable
              as List<WalletStatus>,
      wallets: null == wallets
          ? _value.wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<Wallet>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WalletStatus status,
      List<WalletStatus> syncWalletStatus,
      List<Wallet> wallets,
      String error});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? syncWalletStatus = null,
    Object? wallets = null,
    Object? error = null,
  }) {
    return _then(_$HomeStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WalletStatus,
      syncWalletStatus: null == syncWalletStatus
          ? _value._syncWalletStatus
          : syncWalletStatus // ignore: cast_nullable_to_non_nullable
              as List<WalletStatus>,
      wallets: null == wallets
          ? _value._wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<Wallet>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.status = WalletStatus.initial,
      final List<WalletStatus> syncWalletStatus = const [],
      final List<Wallet> wallets = const [],
      this.error = ''})
      : _syncWalletStatus = syncWalletStatus,
        _wallets = wallets;

  @override
  @JsonKey()
  final WalletStatus status;
  final List<WalletStatus> _syncWalletStatus;
  @override
  @JsonKey()
  List<WalletStatus> get syncWalletStatus {
    if (_syncWalletStatus is EqualUnmodifiableListView)
      return _syncWalletStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_syncWalletStatus);
  }

  final List<Wallet> _wallets;
  @override
  @JsonKey()
  List<Wallet> get wallets {
    if (_wallets is EqualUnmodifiableListView) return _wallets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallets);
  }

  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'HomeState(status: $status, syncWalletStatus: $syncWalletStatus, wallets: $wallets, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._syncWalletStatus, _syncWalletStatus) &&
            const DeepCollectionEquality().equals(other._wallets, _wallets) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_syncWalletStatus),
      const DeepCollectionEquality().hash(_wallets),
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final WalletStatus status,
      final List<WalletStatus> syncWalletStatus,
      final List<Wallet> wallets,
      final String error}) = _$HomeStateImpl;

  @override
  WalletStatus get status;
  @override
  List<WalletStatus> get syncWalletStatus;
  @override
  List<Wallet> get wallets;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
