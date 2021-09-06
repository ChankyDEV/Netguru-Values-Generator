// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'all_sentences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AllSentencesEventTearOff {
  const _$AllSentencesEventTearOff();

  GetAllSentences getAllSentences() {
    return const GetAllSentences();
  }
}

/// @nodoc
const $AllSentencesEvent = _$AllSentencesEventTearOff();

/// @nodoc
mixin _$AllSentencesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSentences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSentences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllSentences value) getAllSentences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllSentences value)? getAllSentences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllSentencesEventCopyWith<$Res> {
  factory $AllSentencesEventCopyWith(
          AllSentencesEvent value, $Res Function(AllSentencesEvent) then) =
      _$AllSentencesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AllSentencesEventCopyWithImpl<$Res>
    implements $AllSentencesEventCopyWith<$Res> {
  _$AllSentencesEventCopyWithImpl(this._value, this._then);

  final AllSentencesEvent _value;
  // ignore: unused_field
  final $Res Function(AllSentencesEvent) _then;
}

/// @nodoc
abstract class $GetAllSentencesCopyWith<$Res> {
  factory $GetAllSentencesCopyWith(
          GetAllSentences value, $Res Function(GetAllSentences) then) =
      _$GetAllSentencesCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetAllSentencesCopyWithImpl<$Res>
    extends _$AllSentencesEventCopyWithImpl<$Res>
    implements $GetAllSentencesCopyWith<$Res> {
  _$GetAllSentencesCopyWithImpl(
      GetAllSentences _value, $Res Function(GetAllSentences) _then)
      : super(_value, (v) => _then(v as GetAllSentences));

  @override
  GetAllSentences get _value => super._value as GetAllSentences;
}

/// @nodoc

class _$GetAllSentences implements GetAllSentences {
  const _$GetAllSentences();

  @override
  String toString() {
    return 'AllSentencesEvent.getAllSentences()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetAllSentences);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSentences,
  }) {
    return getAllSentences();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSentences,
    required TResult orElse(),
  }) {
    if (getAllSentences != null) {
      return getAllSentences();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllSentences value) getAllSentences,
  }) {
    return getAllSentences(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllSentences value)? getAllSentences,
    required TResult orElse(),
  }) {
    if (getAllSentences != null) {
      return getAllSentences(this);
    }
    return orElse();
  }
}

abstract class GetAllSentences implements AllSentencesEvent {
  const factory GetAllSentences() = _$GetAllSentences;
}

/// @nodoc
class _$AllSentencesStateTearOff {
  const _$AllSentencesStateTearOff();

  Initial initial(
      {required List<Sentence> sentences,
      required bool hasErrors,
      required bool isLoading}) {
    return Initial(
      sentences: sentences,
      hasErrors: hasErrors,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $AllSentencesState = _$AllSentencesStateTearOff();

/// @nodoc
mixin _$AllSentencesState {
  List<Sentence> get sentences => throw _privateConstructorUsedError;
  bool get hasErrors => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Sentence> sentences, bool hasErrors, bool isLoading)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Sentence> sentences, bool hasErrors, bool isLoading)?
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
  $AllSentencesStateCopyWith<AllSentencesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllSentencesStateCopyWith<$Res> {
  factory $AllSentencesStateCopyWith(
          AllSentencesState value, $Res Function(AllSentencesState) then) =
      _$AllSentencesStateCopyWithImpl<$Res>;
  $Res call({List<Sentence> sentences, bool hasErrors, bool isLoading});
}

/// @nodoc
class _$AllSentencesStateCopyWithImpl<$Res>
    implements $AllSentencesStateCopyWith<$Res> {
  _$AllSentencesStateCopyWithImpl(this._value, this._then);

  final AllSentencesState _value;
  // ignore: unused_field
  final $Res Function(AllSentencesState) _then;

  @override
  $Res call({
    Object? sentences = freezed,
    Object? hasErrors = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      sentences: sentences == freezed
          ? _value.sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
      hasErrors: hasErrors == freezed
          ? _value.hasErrors
          : hasErrors // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class $InitialCopyWith<$Res>
    implements $AllSentencesStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
  @override
  $Res call({List<Sentence> sentences, bool hasErrors, bool isLoading});
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$AllSentencesStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;

  @override
  $Res call({
    Object? sentences = freezed,
    Object? hasErrors = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(Initial(
      sentences: sentences == freezed
          ? _value.sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
      hasErrors: hasErrors == freezed
          ? _value.hasErrors
          : hasErrors // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {required this.sentences,
      required this.hasErrors,
      required this.isLoading});

  @override
  final List<Sentence> sentences;
  @override
  final bool hasErrors;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'AllSentencesState.initial(sentences: $sentences, hasErrors: $hasErrors, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Initial &&
            (identical(other.sentences, sentences) ||
                const DeepCollectionEquality()
                    .equals(other.sentences, sentences)) &&
            (identical(other.hasErrors, hasErrors) ||
                const DeepCollectionEquality()
                    .equals(other.hasErrors, hasErrors)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sentences) ^
      const DeepCollectionEquality().hash(hasErrors) ^
      const DeepCollectionEquality().hash(isLoading);

  @JsonKey(ignore: true)
  @override
  $InitialCopyWith<Initial> get copyWith =>
      _$InitialCopyWithImpl<Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Sentence> sentences, bool hasErrors, bool isLoading)
        initial,
  }) {
    return initial(sentences, hasErrors, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Sentence> sentences, bool hasErrors, bool isLoading)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(sentences, hasErrors, isLoading);
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

abstract class Initial implements AllSentencesState {
  const factory Initial(
      {required List<Sentence> sentences,
      required bool hasErrors,
      required bool isLoading}) = _$Initial;

  @override
  List<Sentence> get sentences => throw _privateConstructorUsedError;
  @override
  bool get hasErrors => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InitialCopyWith<Initial> get copyWith => throw _privateConstructorUsedError;
}
