// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SigninState {
  bool get showError => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  bool get isImgUploding => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SigninStateCopyWith<SigninState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigninStateCopyWith<$Res> {
  factory $SigninStateCopyWith(
          SigninState value, $Res Function(SigninState) then) =
      _$SigninStateCopyWithImpl<$Res>;
  $Res call(
      {bool showError,
      String errorMsg,
      String? verificationId,
      bool isImgUploding,
      String? imgUrl});
}

/// @nodoc
class _$SigninStateCopyWithImpl<$Res> implements $SigninStateCopyWith<$Res> {
  _$SigninStateCopyWithImpl(this._value, this._then);

  final SigninState _value;
  // ignore: unused_field
  final $Res Function(SigninState) _then;

  @override
  $Res call({
    Object? showError = freezed,
    Object? errorMsg = freezed,
    Object? verificationId = freezed,
    Object? isImgUploding = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      showError: showError == freezed
          ? _value.showError
          : showError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      isImgUploding: isImgUploding == freezed
          ? _value.isImgUploding
          : isImgUploding // ignore: cast_nullable_to_non_nullable
              as bool,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SigninStateCopyWith<$Res>
    implements $SigninStateCopyWith<$Res> {
  factory _$SigninStateCopyWith(
          _SigninState value, $Res Function(_SigninState) then) =
      __$SigninStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showError,
      String errorMsg,
      String? verificationId,
      bool isImgUploding,
      String? imgUrl});
}

/// @nodoc
class __$SigninStateCopyWithImpl<$Res> extends _$SigninStateCopyWithImpl<$Res>
    implements _$SigninStateCopyWith<$Res> {
  __$SigninStateCopyWithImpl(
      _SigninState _value, $Res Function(_SigninState) _then)
      : super(_value, (v) => _then(v as _SigninState));

  @override
  _SigninState get _value => super._value as _SigninState;

  @override
  $Res call({
    Object? showError = freezed,
    Object? errorMsg = freezed,
    Object? verificationId = freezed,
    Object? isImgUploding = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_SigninState(
      showError: showError == freezed
          ? _value.showError
          : showError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      isImgUploding: isImgUploding == freezed
          ? _value.isImgUploding
          : isImgUploding // ignore: cast_nullable_to_non_nullable
              as bool,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SigninState implements _SigninState {
  const _$_SigninState(
      {required this.showError,
      required this.errorMsg,
      required this.verificationId,
      required this.isImgUploding,
      required this.imgUrl});

  @override
  final bool showError;
  @override
  final String errorMsg;
  @override
  final String? verificationId;
  @override
  final bool isImgUploding;
  @override
  final String? imgUrl;

  @override
  String toString() {
    return 'SigninState(showError: $showError, errorMsg: $errorMsg, verificationId: $verificationId, isImgUploding: $isImgUploding, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SigninState &&
            const DeepCollectionEquality().equals(other.showError, showError) &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg) &&
            const DeepCollectionEquality()
                .equals(other.verificationId, verificationId) &&
            const DeepCollectionEquality()
                .equals(other.isImgUploding, isImgUploding) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showError),
      const DeepCollectionEquality().hash(errorMsg),
      const DeepCollectionEquality().hash(verificationId),
      const DeepCollectionEquality().hash(isImgUploding),
      const DeepCollectionEquality().hash(imgUrl));

  @JsonKey(ignore: true)
  @override
  _$SigninStateCopyWith<_SigninState> get copyWith =>
      __$SigninStateCopyWithImpl<_SigninState>(this, _$identity);
}

abstract class _SigninState implements SigninState {
  const factory _SigninState(
      {required final bool showError,
      required final String errorMsg,
      required final String? verificationId,
      required final bool isImgUploding,
      required final String? imgUrl}) = _$_SigninState;

  @override
  bool get showError => throw _privateConstructorUsedError;
  @override
  String get errorMsg => throw _privateConstructorUsedError;
  @override
  String? get verificationId => throw _privateConstructorUsedError;
  @override
  bool get isImgUploding => throw _privateConstructorUsedError;
  @override
  String? get imgUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SigninStateCopyWith<_SigninState> get copyWith =>
      throw _privateConstructorUsedError;
}
