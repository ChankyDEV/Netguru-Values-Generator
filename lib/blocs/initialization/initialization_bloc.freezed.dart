// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'initialization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InitializationEventTearOff {
  const _$InitializationEventTearOff();

  ConfigureApp configureApp() {
    return const ConfigureApp();
  }
}

/// @nodoc
const $InitializationEvent = _$InitializationEventTearOff();

/// @nodoc
mixin _$InitializationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() configureApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? configureApp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConfigureApp value) configureApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfigureApp value)? configureApp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationEventCopyWith<$Res> {
  factory $InitializationEventCopyWith(
          InitializationEvent value, $Res Function(InitializationEvent) then) =
      _$InitializationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializationEventCopyWithImpl<$Res>
    implements $InitializationEventCopyWith<$Res> {
  _$InitializationEventCopyWithImpl(this._value, this._then);

  final InitializationEvent _value;
  // ignore: unused_field
  final $Res Function(InitializationEvent) _then;
}

/// @nodoc
abstract class $ConfigureAppCopyWith<$Res> {
  factory $ConfigureAppCopyWith(
          ConfigureApp value, $Res Function(ConfigureApp) then) =
      _$ConfigureAppCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConfigureAppCopyWithImpl<$Res>
    extends _$InitializationEventCopyWithImpl<$Res>
    implements $ConfigureAppCopyWith<$Res> {
  _$ConfigureAppCopyWithImpl(
      ConfigureApp _value, $Res Function(ConfigureApp) _then)
      : super(_value, (v) => _then(v as ConfigureApp));

  @override
  ConfigureApp get _value => super._value as ConfigureApp;
}

/// @nodoc

class _$ConfigureApp implements ConfigureApp {
  const _$ConfigureApp();

  @override
  String toString() {
    return 'InitializationEvent.configureApp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ConfigureApp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() configureApp,
  }) {
    return configureApp();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? configureApp,
    required TResult orElse(),
  }) {
    if (configureApp != null) {
      return configureApp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConfigureApp value) configureApp,
  }) {
    return configureApp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConfigureApp value)? configureApp,
    required TResult orElse(),
  }) {
    if (configureApp != null) {
      return configureApp(this);
    }
    return orElse();
  }
}

abstract class ConfigureApp implements InitializationEvent {
  const factory ConfigureApp() = _$ConfigureApp;
}

/// @nodoc
class _$InitializationStateTearOff {
  const _$InitializationStateTearOff();

  Initial initial({required bool isLoading, required bool didConfigureApp}) {
    return Initial(
      isLoading: isLoading,
      didConfigureApp: didConfigureApp,
    );
  }
}

/// @nodoc
const $InitializationState = _$InitializationStateTearOff();

/// @nodoc
mixin _$InitializationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get didConfigureApp => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, bool didConfigureApp) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, bool didConfigureApp)? initial,
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
  $InitializationStateCopyWith<InitializationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationStateCopyWith<$Res> {
  factory $InitializationStateCopyWith(
          InitializationState value, $Res Function(InitializationState) then) =
      _$InitializationStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool didConfigureApp});
}

/// @nodoc
class _$InitializationStateCopyWithImpl<$Res>
    implements $InitializationStateCopyWith<$Res> {
  _$InitializationStateCopyWithImpl(this._value, this._then);

  final InitializationState _value;
  // ignore: unused_field
  final $Res Function(InitializationState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? didConfigureApp = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      didConfigureApp: didConfigureApp == freezed
          ? _value.didConfigureApp
          : didConfigureApp // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class $InitialCopyWith<$Res>
    implements $InitializationStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool didConfigureApp});
}

/// @nodoc
class _$InitialCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? didConfigureApp = freezed,
  }) {
    return _then(Initial(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      didConfigureApp: didConfigureApp == freezed
          ? _value.didConfigureApp
          : didConfigureApp // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial({required this.isLoading, required this.didConfigureApp});

  @override
  final bool isLoading;
  @override
  final bool didConfigureApp;

  @override
  String toString() {
    return 'InitializationState.initial(isLoading: $isLoading, didConfigureApp: $didConfigureApp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Initial &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.didConfigureApp, didConfigureApp) ||
                const DeepCollectionEquality()
                    .equals(other.didConfigureApp, didConfigureApp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(didConfigureApp);

  @JsonKey(ignore: true)
  @override
  $InitialCopyWith<Initial> get copyWith =>
      _$InitialCopyWithImpl<Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, bool didConfigureApp) initial,
  }) {
    return initial(isLoading, didConfigureApp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, bool didConfigureApp)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading, didConfigureApp);
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

abstract class Initial implements InitializationState {
  const factory Initial(
      {required bool isLoading, required bool didConfigureApp}) = _$Initial;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get didConfigureApp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InitialCopyWith<Initial> get copyWith => throw _privateConstructorUsedError;
}
