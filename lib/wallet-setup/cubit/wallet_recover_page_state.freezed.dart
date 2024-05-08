// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_recover_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletRecoverPageState {
  LoadStatus get status => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletRecoverPageStateCopyWith<WalletRecoverPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletRecoverPageStateCopyWith<$Res> {
  factory $WalletRecoverPageStateCopyWith(WalletRecoverPageState value,
          $Res Function(WalletRecoverPageState) then) =
      _$WalletRecoverPageStateCopyWithImpl<$Res, WalletRecoverPageState>;
  @useResult
  $Res call({LoadStatus status, String error});
}

/// @nodoc
class _$WalletRecoverPageStateCopyWithImpl<$Res,
        $Val extends WalletRecoverPageState>
    implements $WalletRecoverPageStateCopyWith<$Res> {
  _$WalletRecoverPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletRecoverPageStateImplCopyWith<$Res>
    implements $WalletRecoverPageStateCopyWith<$Res> {
  factory _$$WalletRecoverPageStateImplCopyWith(
          _$WalletRecoverPageStateImpl value,
          $Res Function(_$WalletRecoverPageStateImpl) then) =
      __$$WalletRecoverPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadStatus status, String error});
}

/// @nodoc
class __$$WalletRecoverPageStateImplCopyWithImpl<$Res>
    extends _$WalletRecoverPageStateCopyWithImpl<$Res,
        _$WalletRecoverPageStateImpl>
    implements _$$WalletRecoverPageStateImplCopyWith<$Res> {
  __$$WalletRecoverPageStateImplCopyWithImpl(
      _$WalletRecoverPageStateImpl _value,
      $Res Function(_$WalletRecoverPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = null,
  }) {
    return _then(_$WalletRecoverPageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WalletRecoverPageStateImpl implements _WalletRecoverPageState {
  const _$WalletRecoverPageStateImpl(
      {this.status = LoadStatus.initial, this.error = ''});

  @override
  @JsonKey()
  final LoadStatus status;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'WalletRecoverPageState(status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletRecoverPageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletRecoverPageStateImplCopyWith<_$WalletRecoverPageStateImpl>
      get copyWith => __$$WalletRecoverPageStateImplCopyWithImpl<
          _$WalletRecoverPageStateImpl>(this, _$identity);
}

abstract class _WalletRecoverPageState implements WalletRecoverPageState {
  const factory _WalletRecoverPageState(
      {final LoadStatus status,
      final String error}) = _$WalletRecoverPageStateImpl;

  @override
  LoadStatus get status;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$WalletRecoverPageStateImplCopyWith<_$WalletRecoverPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
