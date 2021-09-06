// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'favourite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FavouriteEventTearOff {
  const _$FavouriteEventTearOff();

  GetFavourites getFavourites() {
    return const GetFavourites();
  }
}

/// @nodoc
const $FavouriteEvent = _$FavouriteEventTearOff();

/// @nodoc
mixin _$FavouriteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFavourites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFavourites,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFavourites value) getFavourites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFavourites value)? getFavourites,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteEventCopyWith<$Res> {
  factory $FavouriteEventCopyWith(
          FavouriteEvent value, $Res Function(FavouriteEvent) then) =
      _$FavouriteEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavouriteEventCopyWithImpl<$Res>
    implements $FavouriteEventCopyWith<$Res> {
  _$FavouriteEventCopyWithImpl(this._value, this._then);

  final FavouriteEvent _value;
  // ignore: unused_field
  final $Res Function(FavouriteEvent) _then;
}

/// @nodoc
abstract class $GetFavouritesCopyWith<$Res> {
  factory $GetFavouritesCopyWith(
          GetFavourites value, $Res Function(GetFavourites) then) =
      _$GetFavouritesCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetFavouritesCopyWithImpl<$Res>
    extends _$FavouriteEventCopyWithImpl<$Res>
    implements $GetFavouritesCopyWith<$Res> {
  _$GetFavouritesCopyWithImpl(
      GetFavourites _value, $Res Function(GetFavourites) _then)
      : super(_value, (v) => _then(v as GetFavourites));

  @override
  GetFavourites get _value => super._value as GetFavourites;
}

/// @nodoc

class _$GetFavourites implements GetFavourites {
  const _$GetFavourites();

  @override
  String toString() {
    return 'FavouriteEvent.getFavourites()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetFavourites);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFavourites,
  }) {
    return getFavourites();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFavourites,
    required TResult orElse(),
  }) {
    if (getFavourites != null) {
      return getFavourites();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFavourites value) getFavourites,
  }) {
    return getFavourites(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFavourites value)? getFavourites,
    required TResult orElse(),
  }) {
    if (getFavourites != null) {
      return getFavourites(this);
    }
    return orElse();
  }
}

abstract class GetFavourites implements FavouriteEvent {
  const factory GetFavourites() = _$GetFavourites;
}

/// @nodoc
class _$FavouriteStateTearOff {
  const _$FavouriteStateTearOff();

  Initial initial(
      {required List<Sentence> favourites,
      required bool hasError,
      required bool isLoading,
      required String errorMessage}) {
    return Initial(
      favourites: favourites,
      hasError: hasError,
      isLoading: isLoading,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $FavouriteState = _$FavouriteStateTearOff();

/// @nodoc
mixin _$FavouriteState {
  List<Sentence> get favourites => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Sentence> favourites, bool hasError,
            bool isLoading, String errorMessage)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Sentence> favourites, bool hasError, bool isLoading,
            String errorMessage)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouriteStateCopyWith<FavouriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteStateCopyWith<$Res> {
  factory $FavouriteStateCopyWith(
          FavouriteState value, $Res Function(FavouriteState) then) =
      _$FavouriteStateCopyWithImpl<$Res>;
  $Res call(
      {List<Sentence> favourites,
      bool hasError,
      bool isLoading,
      String errorMessage});
}

/// @nodoc
class _$FavouriteStateCopyWithImpl<$Res>
    implements $FavouriteStateCopyWith<$Res> {
  _$FavouriteStateCopyWithImpl(this._value, this._then);

  final FavouriteState _value;
  // ignore: unused_field
  final $Res Function(FavouriteState) _then;

  @override
  $Res call({
    Object? favourites = freezed,
    Object? hasError = freezed,
    Object? isLoading = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      favourites: favourites == freezed
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $InitialCopyWith<$Res> implements $FavouriteStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Sentence> favourites,
      bool hasError,
      bool isLoading,
      String errorMessage});
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$FavouriteStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;

  @override
  $Res call({
    Object? favourites = freezed,
    Object? hasError = freezed,
    Object? isLoading = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(Initial(
      favourites: favourites == freezed
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {required this.favourites,
      required this.hasError,
      required this.isLoading,
      required this.errorMessage});

  @override
  final List<Sentence> favourites;
  @override
  final bool hasError;
  @override
  final bool isLoading;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'FavouriteState.initial(favourites: $favourites, hasError: $hasError, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Initial &&
            (identical(other.favourites, favourites) ||
                const DeepCollectionEquality()
                    .equals(other.favourites, favourites)) &&
            (identical(other.hasError, hasError) ||
                const DeepCollectionEquality()
                    .equals(other.hasError, hasError)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(favourites) ^
      const DeepCollectionEquality().hash(hasError) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  $InitialCopyWith<Initial> get copyWith =>
      _$InitialCopyWithImpl<Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Sentence> favourites, bool hasError,
            bool isLoading, String errorMessage)
        initial,
  }) {
    return initial(favourites, hasError, isLoading, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Sentence> favourites, bool hasError, bool isLoading,
            String errorMessage)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(favourites, hasError, isLoading, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements FavouriteState {
  const factory Initial(
      {required List<Sentence> favourites,
      required bool hasError,
      required bool isLoading,
      required String errorMessage}) = _$Initial;

  @override
  List<Sentence> get favourites => throw _privateConstructorUsedError;
  @override
  bool get hasError => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  String get errorMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InitialCopyWith<Initial> get copyWith => throw _privateConstructorUsedError;
}
