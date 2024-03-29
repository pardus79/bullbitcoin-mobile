// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tx_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TxState {
  LoadStatus get status => throw _privateConstructorUsedError;
  List<Tx> get txs => throw _privateConstructorUsedError;
  Tx? get selectedTx => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TxStateCopyWith<TxState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TxStateCopyWith<$Res> {
  factory $TxStateCopyWith(TxState value, $Res Function(TxState) then) =
      _$TxStateCopyWithImpl<$Res, TxState>;
  @useResult
  $Res call({LoadStatus status, List<Tx> txs, Tx? selectedTx, String error});
}

/// @nodoc
class _$TxStateCopyWithImpl<$Res, $Val extends TxState>
    implements $TxStateCopyWith<$Res> {
  _$TxStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? txs = null,
    Object? selectedTx = freezed,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      txs: null == txs
          ? _value.txs
          : txs // ignore: cast_nullable_to_non_nullable
              as List<Tx>,
      selectedTx: freezed == selectedTx
          ? _value.selectedTx
          : selectedTx // ignore: cast_nullable_to_non_nullable
              as Tx?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TxStateImplCopyWith<$Res> implements $TxStateCopyWith<$Res> {
  factory _$$TxStateImplCopyWith(
          _$TxStateImpl value, $Res Function(_$TxStateImpl) then) =
      __$$TxStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadStatus status, List<Tx> txs, Tx? selectedTx, String error});
}

/// @nodoc
class __$$TxStateImplCopyWithImpl<$Res>
    extends _$TxStateCopyWithImpl<$Res, _$TxStateImpl>
    implements _$$TxStateImplCopyWith<$Res> {
  __$$TxStateImplCopyWithImpl(
      _$TxStateImpl _value, $Res Function(_$TxStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? txs = null,
    Object? selectedTx = freezed,
    Object? error = null,
  }) {
    return _then(_$TxStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      txs: null == txs
          ? _value._txs
          : txs // ignore: cast_nullable_to_non_nullable
              as List<Tx>,
      selectedTx: freezed == selectedTx
          ? _value.selectedTx
          : selectedTx // ignore: cast_nullable_to_non_nullable
              as Tx?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TxStateImpl implements _TxState {
  const _$TxStateImpl(
      {this.status = LoadStatus.initial,
      final List<Tx> txs = const [],
      this.selectedTx = null,
      this.error = ''})
      : _txs = txs;

  @override
  @JsonKey()
  final LoadStatus status;
  final List<Tx> _txs;
  @override
  @JsonKey()
  List<Tx> get txs {
    if (_txs is EqualUnmodifiableListView) return _txs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_txs);
  }

  @override
  @JsonKey()
  final Tx? selectedTx;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'TxState(status: $status, txs: $txs, selectedTx: $selectedTx, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TxStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._txs, _txs) &&
            const DeepCollectionEquality()
                .equals(other.selectedTx, selectedTx) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_txs),
      const DeepCollectionEquality().hash(selectedTx),
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TxStateImplCopyWith<_$TxStateImpl> get copyWith =>
      __$$TxStateImplCopyWithImpl<_$TxStateImpl>(this, _$identity);
}

abstract class _TxState implements TxState {
  const factory _TxState(
      {final LoadStatus status,
      final List<Tx> txs,
      final Tx? selectedTx,
      final String error}) = _$TxStateImpl;

  @override
  LoadStatus get status;
  @override
  List<Tx> get txs;
  @override
  Tx? get selectedTx;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$TxStateImplCopyWith<_$TxStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
