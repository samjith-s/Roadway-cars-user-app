// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favourites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavouritesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllFavourites,
    required TResult Function(String vehicleId) addOrRemoveFromFavourites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllFavourites,
    TResult Function(String vehicleId)? addOrRemoveFromFavourites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllFavourites,
    TResult Function(String vehicleId)? addOrRemoveFromFavourites,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllFavourites value) getAllFavourites,
    required TResult Function(AddOrRemoveFromFavourites value)
        addOrRemoveFromFavourites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllFavourites value)? getAllFavourites,
    TResult Function(AddOrRemoveFromFavourites value)?
        addOrRemoveFromFavourites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllFavourites value)? getAllFavourites,
    TResult Function(AddOrRemoveFromFavourites value)?
        addOrRemoveFromFavourites,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesEventCopyWith<$Res> {
  factory $FavouritesEventCopyWith(
          FavouritesEvent value, $Res Function(FavouritesEvent) then) =
      _$FavouritesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavouritesEventCopyWithImpl<$Res>
    implements $FavouritesEventCopyWith<$Res> {
  _$FavouritesEventCopyWithImpl(this._value, this._then);

  final FavouritesEvent _value;
  // ignore: unused_field
  final $Res Function(FavouritesEvent) _then;
}

/// @nodoc
abstract class $GetAllFavouritesCopyWith<$Res> {
  factory $GetAllFavouritesCopyWith(
          GetAllFavourites value, $Res Function(GetAllFavourites) then) =
      _$GetAllFavouritesCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetAllFavouritesCopyWithImpl<$Res>
    extends _$FavouritesEventCopyWithImpl<$Res>
    implements $GetAllFavouritesCopyWith<$Res> {
  _$GetAllFavouritesCopyWithImpl(
      GetAllFavourites _value, $Res Function(GetAllFavourites) _then)
      : super(_value, (v) => _then(v as GetAllFavourites));

  @override
  GetAllFavourites get _value => super._value as GetAllFavourites;
}

/// @nodoc

class _$GetAllFavourites implements GetAllFavourites {
  const _$GetAllFavourites();

  @override
  String toString() {
    return 'FavouritesEvent.getAllFavourites()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetAllFavourites);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllFavourites,
    required TResult Function(String vehicleId) addOrRemoveFromFavourites,
  }) {
    return getAllFavourites();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllFavourites,
    TResult Function(String vehicleId)? addOrRemoveFromFavourites,
  }) {
    return getAllFavourites?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllFavourites,
    TResult Function(String vehicleId)? addOrRemoveFromFavourites,
    required TResult orElse(),
  }) {
    if (getAllFavourites != null) {
      return getAllFavourites();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllFavourites value) getAllFavourites,
    required TResult Function(AddOrRemoveFromFavourites value)
        addOrRemoveFromFavourites,
  }) {
    return getAllFavourites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllFavourites value)? getAllFavourites,
    TResult Function(AddOrRemoveFromFavourites value)?
        addOrRemoveFromFavourites,
  }) {
    return getAllFavourites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllFavourites value)? getAllFavourites,
    TResult Function(AddOrRemoveFromFavourites value)?
        addOrRemoveFromFavourites,
    required TResult orElse(),
  }) {
    if (getAllFavourites != null) {
      return getAllFavourites(this);
    }
    return orElse();
  }
}

abstract class GetAllFavourites implements FavouritesEvent {
  const factory GetAllFavourites() = _$GetAllFavourites;
}

/// @nodoc
abstract class $AddOrRemoveFromFavouritesCopyWith<$Res> {
  factory $AddOrRemoveFromFavouritesCopyWith(AddOrRemoveFromFavourites value,
          $Res Function(AddOrRemoveFromFavourites) then) =
      _$AddOrRemoveFromFavouritesCopyWithImpl<$Res>;
  $Res call({String vehicleId});
}

/// @nodoc
class _$AddOrRemoveFromFavouritesCopyWithImpl<$Res>
    extends _$FavouritesEventCopyWithImpl<$Res>
    implements $AddOrRemoveFromFavouritesCopyWith<$Res> {
  _$AddOrRemoveFromFavouritesCopyWithImpl(AddOrRemoveFromFavourites _value,
      $Res Function(AddOrRemoveFromFavourites) _then)
      : super(_value, (v) => _then(v as AddOrRemoveFromFavourites));

  @override
  AddOrRemoveFromFavourites get _value =>
      super._value as AddOrRemoveFromFavourites;

  @override
  $Res call({
    Object? vehicleId = freezed,
  }) {
    return _then(AddOrRemoveFromFavourites(
      vehicleId: vehicleId == freezed
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddOrRemoveFromFavourites implements AddOrRemoveFromFavourites {
  const _$AddOrRemoveFromFavourites({required this.vehicleId});

  @override
  final String vehicleId;

  @override
  String toString() {
    return 'FavouritesEvent.addOrRemoveFromFavourites(vehicleId: $vehicleId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddOrRemoveFromFavourites &&
            const DeepCollectionEquality().equals(other.vehicleId, vehicleId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(vehicleId));

  @JsonKey(ignore: true)
  @override
  $AddOrRemoveFromFavouritesCopyWith<AddOrRemoveFromFavourites> get copyWith =>
      _$AddOrRemoveFromFavouritesCopyWithImpl<AddOrRemoveFromFavourites>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllFavourites,
    required TResult Function(String vehicleId) addOrRemoveFromFavourites,
  }) {
    return addOrRemoveFromFavourites(vehicleId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getAllFavourites,
    TResult Function(String vehicleId)? addOrRemoveFromFavourites,
  }) {
    return addOrRemoveFromFavourites?.call(vehicleId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllFavourites,
    TResult Function(String vehicleId)? addOrRemoveFromFavourites,
    required TResult orElse(),
  }) {
    if (addOrRemoveFromFavourites != null) {
      return addOrRemoveFromFavourites(vehicleId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllFavourites value) getAllFavourites,
    required TResult Function(AddOrRemoveFromFavourites value)
        addOrRemoveFromFavourites,
  }) {
    return addOrRemoveFromFavourites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetAllFavourites value)? getAllFavourites,
    TResult Function(AddOrRemoveFromFavourites value)?
        addOrRemoveFromFavourites,
  }) {
    return addOrRemoveFromFavourites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllFavourites value)? getAllFavourites,
    TResult Function(AddOrRemoveFromFavourites value)?
        addOrRemoveFromFavourites,
    required TResult orElse(),
  }) {
    if (addOrRemoveFromFavourites != null) {
      return addOrRemoveFromFavourites(this);
    }
    return orElse();
  }
}

abstract class AddOrRemoveFromFavourites implements FavouritesEvent {
  const factory AddOrRemoveFromFavourites({required final String vehicleId}) =
      _$AddOrRemoveFromFavourites;

  String get vehicleId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddOrRemoveFromFavouritesCopyWith<AddOrRemoveFromFavourites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavouritesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;
  List<String> get favouritesIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouritesStateCopyWith<FavouritesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesStateCopyWith<$Res> {
  factory $FavouritesStateCopyWith(
          FavouritesState value, $Res Function(FavouritesState) then) =
      _$FavouritesStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isError,
      String errorMsg,
      List<String> favouritesIds});
}

/// @nodoc
class _$FavouritesStateCopyWithImpl<$Res>
    implements $FavouritesStateCopyWith<$Res> {
  _$FavouritesStateCopyWithImpl(this._value, this._then);

  final FavouritesState _value;
  // ignore: unused_field
  final $Res Function(FavouritesState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? errorMsg = freezed,
    Object? favouritesIds = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      favouritesIds: favouritesIds == freezed
          ? _value.favouritesIds
          : favouritesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$FavouritesStateCopyWith<$Res>
    implements $FavouritesStateCopyWith<$Res> {
  factory _$FavouritesStateCopyWith(
          _FavouritesState value, $Res Function(_FavouritesState) then) =
      __$FavouritesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isError,
      String errorMsg,
      List<String> favouritesIds});
}

/// @nodoc
class __$FavouritesStateCopyWithImpl<$Res>
    extends _$FavouritesStateCopyWithImpl<$Res>
    implements _$FavouritesStateCopyWith<$Res> {
  __$FavouritesStateCopyWithImpl(
      _FavouritesState _value, $Res Function(_FavouritesState) _then)
      : super(_value, (v) => _then(v as _FavouritesState));

  @override
  _FavouritesState get _value => super._value as _FavouritesState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? errorMsg = freezed,
    Object? favouritesIds = freezed,
  }) {
    return _then(_FavouritesState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      favouritesIds: favouritesIds == freezed
          ? _value.favouritesIds
          : favouritesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_FavouritesState implements _FavouritesState {
  const _$_FavouritesState(
      {required this.isLoading,
      required this.isError,
      required this.errorMsg,
      required final List<String> favouritesIds})
      : _favouritesIds = favouritesIds;

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final String errorMsg;
  final List<String> _favouritesIds;
  @override
  List<String> get favouritesIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favouritesIds);
  }

  @override
  String toString() {
    return 'FavouritesState(isLoading: $isLoading, isError: $isError, errorMsg: $errorMsg, favouritesIds: $favouritesIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavouritesState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg) &&
            const DeepCollectionEquality()
                .equals(other.favouritesIds, favouritesIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(errorMsg),
      const DeepCollectionEquality().hash(favouritesIds));

  @JsonKey(ignore: true)
  @override
  _$FavouritesStateCopyWith<_FavouritesState> get copyWith =>
      __$FavouritesStateCopyWithImpl<_FavouritesState>(this, _$identity);
}

abstract class _FavouritesState implements FavouritesState {
  const factory _FavouritesState(
      {required final bool isLoading,
      required final bool isError,
      required final String errorMsg,
      required final List<String> favouritesIds}) = _$_FavouritesState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isError => throw _privateConstructorUsedError;
  @override
  String get errorMsg => throw _privateConstructorUsedError;
  @override
  List<String> get favouritesIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FavouritesStateCopyWith<_FavouritesState> get copyWith =>
      throw _privateConstructorUsedError;
}
