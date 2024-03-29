// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletPageState {
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletPageStateCopyWith<WalletPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletPageStateCopyWith<$Res> {
  factory $WalletPageStateCopyWith(
          WalletPageState value, $Res Function(WalletPageState) then) =
      _$WalletPageStateCopyWithImpl<$Res, WalletPageState>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$WalletPageStateCopyWithImpl<$Res, $Val extends WalletPageState>
    implements $WalletPageStateCopyWith<$Res> {
  _$WalletPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletPageStateImplCopyWith<$Res>
    implements $WalletPageStateCopyWith<$Res> {
  factory _$$WalletPageStateImplCopyWith(_$WalletPageStateImpl value,
          $Res Function(_$WalletPageStateImpl) then) =
      __$$WalletPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$WalletPageStateImplCopyWithImpl<$Res>
    extends _$WalletPageStateCopyWithImpl<$Res, _$WalletPageStateImpl>
    implements _$$WalletPageStateImplCopyWith<$Res> {
  __$$WalletPageStateImplCopyWithImpl(
      _$WalletPageStateImpl _value, $Res Function(_$WalletPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$WalletPageStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WalletPageStateImpl implements _WalletPageState {
  const _$WalletPageStateImpl({this.error = ''});

  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'WalletPageState(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletPageStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletPageStateImplCopyWith<_$WalletPageStateImpl> get copyWith =>
      __$$WalletPageStateImplCopyWithImpl<_$WalletPageStateImpl>(
          this, _$identity);
}

abstract class _WalletPageState implements WalletPageState {
  const factory _WalletPageState({final String error}) = _$WalletPageStateImpl;

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$WalletPageStateImplCopyWith<_$WalletPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
