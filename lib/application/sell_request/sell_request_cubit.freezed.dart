// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sell_request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SellRequestState {
  int get selectedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SellRequestStateCopyWith<SellRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellRequestStateCopyWith<$Res> {
  factory $SellRequestStateCopyWith(
          SellRequestState value, $Res Function(SellRequestState) then) =
      _$SellRequestStateCopyWithImpl<$Res>;
  $Res call({int selectedDate});
}

/// @nodoc
class _$SellRequestStateCopyWithImpl<$Res>
    implements $SellRequestStateCopyWith<$Res> {
  _$SellRequestStateCopyWithImpl(this._value, this._then);

  final SellRequestState _value;
  // ignore: unused_field
  final $Res Function(SellRequestState) _then;

  @override
  $Res call({
    Object? selectedDate = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_SellRequestStateCopyWith<$Res>
    implements $SellRequestStateCopyWith<$Res> {
  factory _$$_SellRequestStateCopyWith(
          _$_SellRequestState value, $Res Function(_$_SellRequestState) then) =
      __$$_SellRequestStateCopyWithImpl<$Res>;
  @override
  $Res call({int selectedDate});
}

/// @nodoc
class __$$_SellRequestStateCopyWithImpl<$Res>
    extends _$SellRequestStateCopyWithImpl<$Res>
    implements _$$_SellRequestStateCopyWith<$Res> {
  __$$_SellRequestStateCopyWithImpl(
      _$_SellRequestState _value, $Res Function(_$_SellRequestState) _then)
      : super(_value, (v) => _then(v as _$_SellRequestState));

  @override
  _$_SellRequestState get _value => super._value as _$_SellRequestState;

  @override
  $Res call({
    Object? selectedDate = freezed,
  }) {
    return _then(_$_SellRequestState(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SellRequestState implements _SellRequestState {
  const _$_SellRequestState({required this.selectedDate});

  @override
  final int selectedDate;

  @override
  String toString() {
    return 'SellRequestState(selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SellRequestState &&
            const DeepCollectionEquality()
                .equals(other.selectedDate, selectedDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectedDate));

  @JsonKey(ignore: true)
  @override
  _$$_SellRequestStateCopyWith<_$_SellRequestState> get copyWith =>
      __$$_SellRequestStateCopyWithImpl<_$_SellRequestState>(this, _$identity);
}

abstract class _SellRequestState implements SellRequestState {
  const factory _SellRequestState({required final int selectedDate}) =
      _$_SellRequestState;

  @override
  int get selectedDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SellRequestStateCopyWith<_$_SellRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}
