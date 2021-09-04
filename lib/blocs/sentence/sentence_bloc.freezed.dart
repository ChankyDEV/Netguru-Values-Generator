// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sentence_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SentenceEventTearOff {
  const _$SentenceEventTearOff();

  GetAllSentences getAllSentences() {
    return const GetAllSentences();
  }

  ShowNewRandomSentence showNewRandomSentence(Sentence sentence) {
    return ShowNewRandomSentence(
      sentence,
    );
  }

  AddToFavourite addToFavourite(Sentence sentence) {
    return AddToFavourite(
      sentence,
    );
  }

  StartShowingSentencesFromParticular startShowingSentencesFromParticular(
      Sentence sentence) {
    return StartShowingSentencesFromParticular(
      sentence,
    );
  }
}

/// @nodoc
const $SentenceEvent = _$SentenceEventTearOff();

/// @nodoc
mixin _$SentenceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSentences,
    required TResult Function(Sentence sentence) showNewRandomSentence,
    required TResult Function(Sentence sentence) addToFavourite,
    required TResult Function(Sentence sentence)
        startShowingSentencesFromParticular,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSentences,
    TResult Function(Sentence sentence)? showNewRandomSentence,
    TResult Function(Sentence sentence)? addToFavourite,
    TResult Function(Sentence sentence)? startShowingSentencesFromParticular,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllSentences value) getAllSentences,
    required TResult Function(ShowNewRandomSentence value)
        showNewRandomSentence,
    required TResult Function(AddToFavourite value) addToFavourite,
    required TResult Function(StartShowingSentencesFromParticular value)
        startShowingSentencesFromParticular,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllSentences value)? getAllSentences,
    TResult Function(ShowNewRandomSentence value)? showNewRandomSentence,
    TResult Function(AddToFavourite value)? addToFavourite,
    TResult Function(StartShowingSentencesFromParticular value)?
        startShowingSentencesFromParticular,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentenceEventCopyWith<$Res> {
  factory $SentenceEventCopyWith(
          SentenceEvent value, $Res Function(SentenceEvent) then) =
      _$SentenceEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SentenceEventCopyWithImpl<$Res>
    implements $SentenceEventCopyWith<$Res> {
  _$SentenceEventCopyWithImpl(this._value, this._then);

  final SentenceEvent _value;
  // ignore: unused_field
  final $Res Function(SentenceEvent) _then;
}

/// @nodoc
abstract class $GetAllSentencesCopyWith<$Res> {
  factory $GetAllSentencesCopyWith(
          GetAllSentences value, $Res Function(GetAllSentences) then) =
      _$GetAllSentencesCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetAllSentencesCopyWithImpl<$Res>
    extends _$SentenceEventCopyWithImpl<$Res>
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
    return 'SentenceEvent.getAllSentences()';
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
    required TResult Function(Sentence sentence) showNewRandomSentence,
    required TResult Function(Sentence sentence) addToFavourite,
    required TResult Function(Sentence sentence)
        startShowingSentencesFromParticular,
  }) {
    return getAllSentences();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSentences,
    TResult Function(Sentence sentence)? showNewRandomSentence,
    TResult Function(Sentence sentence)? addToFavourite,
    TResult Function(Sentence sentence)? startShowingSentencesFromParticular,
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
    required TResult Function(ShowNewRandomSentence value)
        showNewRandomSentence,
    required TResult Function(AddToFavourite value) addToFavourite,
    required TResult Function(StartShowingSentencesFromParticular value)
        startShowingSentencesFromParticular,
  }) {
    return getAllSentences(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllSentences value)? getAllSentences,
    TResult Function(ShowNewRandomSentence value)? showNewRandomSentence,
    TResult Function(AddToFavourite value)? addToFavourite,
    TResult Function(StartShowingSentencesFromParticular value)?
        startShowingSentencesFromParticular,
    required TResult orElse(),
  }) {
    if (getAllSentences != null) {
      return getAllSentences(this);
    }
    return orElse();
  }
}

abstract class GetAllSentences implements SentenceEvent {
  const factory GetAllSentences() = _$GetAllSentences;
}

/// @nodoc
abstract class $ShowNewRandomSentenceCopyWith<$Res> {
  factory $ShowNewRandomSentenceCopyWith(ShowNewRandomSentence value,
          $Res Function(ShowNewRandomSentence) then) =
      _$ShowNewRandomSentenceCopyWithImpl<$Res>;
  $Res call({Sentence sentence});
}

/// @nodoc
class _$ShowNewRandomSentenceCopyWithImpl<$Res>
    extends _$SentenceEventCopyWithImpl<$Res>
    implements $ShowNewRandomSentenceCopyWith<$Res> {
  _$ShowNewRandomSentenceCopyWithImpl(
      ShowNewRandomSentence _value, $Res Function(ShowNewRandomSentence) _then)
      : super(_value, (v) => _then(v as ShowNewRandomSentence));

  @override
  ShowNewRandomSentence get _value => super._value as ShowNewRandomSentence;

  @override
  $Res call({
    Object? sentence = freezed,
  }) {
    return _then(ShowNewRandomSentence(
      sentence == freezed
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as Sentence,
    ));
  }
}

/// @nodoc

class _$ShowNewRandomSentence implements ShowNewRandomSentence {
  const _$ShowNewRandomSentence(this.sentence);

  @override
  final Sentence sentence;

  @override
  String toString() {
    return 'SentenceEvent.showNewRandomSentence(sentence: $sentence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowNewRandomSentence &&
            (identical(other.sentence, sentence) ||
                const DeepCollectionEquality()
                    .equals(other.sentence, sentence)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(sentence);

  @JsonKey(ignore: true)
  @override
  $ShowNewRandomSentenceCopyWith<ShowNewRandomSentence> get copyWith =>
      _$ShowNewRandomSentenceCopyWithImpl<ShowNewRandomSentence>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSentences,
    required TResult Function(Sentence sentence) showNewRandomSentence,
    required TResult Function(Sentence sentence) addToFavourite,
    required TResult Function(Sentence sentence)
        startShowingSentencesFromParticular,
  }) {
    return showNewRandomSentence(sentence);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSentences,
    TResult Function(Sentence sentence)? showNewRandomSentence,
    TResult Function(Sentence sentence)? addToFavourite,
    TResult Function(Sentence sentence)? startShowingSentencesFromParticular,
    required TResult orElse(),
  }) {
    if (showNewRandomSentence != null) {
      return showNewRandomSentence(sentence);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllSentences value) getAllSentences,
    required TResult Function(ShowNewRandomSentence value)
        showNewRandomSentence,
    required TResult Function(AddToFavourite value) addToFavourite,
    required TResult Function(StartShowingSentencesFromParticular value)
        startShowingSentencesFromParticular,
  }) {
    return showNewRandomSentence(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllSentences value)? getAllSentences,
    TResult Function(ShowNewRandomSentence value)? showNewRandomSentence,
    TResult Function(AddToFavourite value)? addToFavourite,
    TResult Function(StartShowingSentencesFromParticular value)?
        startShowingSentencesFromParticular,
    required TResult orElse(),
  }) {
    if (showNewRandomSentence != null) {
      return showNewRandomSentence(this);
    }
    return orElse();
  }
}

abstract class ShowNewRandomSentence implements SentenceEvent {
  const factory ShowNewRandomSentence(Sentence sentence) =
      _$ShowNewRandomSentence;

  Sentence get sentence => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowNewRandomSentenceCopyWith<ShowNewRandomSentence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToFavouriteCopyWith<$Res> {
  factory $AddToFavouriteCopyWith(
          AddToFavourite value, $Res Function(AddToFavourite) then) =
      _$AddToFavouriteCopyWithImpl<$Res>;
  $Res call({Sentence sentence});
}

/// @nodoc
class _$AddToFavouriteCopyWithImpl<$Res>
    extends _$SentenceEventCopyWithImpl<$Res>
    implements $AddToFavouriteCopyWith<$Res> {
  _$AddToFavouriteCopyWithImpl(
      AddToFavourite _value, $Res Function(AddToFavourite) _then)
      : super(_value, (v) => _then(v as AddToFavourite));

  @override
  AddToFavourite get _value => super._value as AddToFavourite;

  @override
  $Res call({
    Object? sentence = freezed,
  }) {
    return _then(AddToFavourite(
      sentence == freezed
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as Sentence,
    ));
  }
}

/// @nodoc

class _$AddToFavourite implements AddToFavourite {
  const _$AddToFavourite(this.sentence);

  @override
  final Sentence sentence;

  @override
  String toString() {
    return 'SentenceEvent.addToFavourite(sentence: $sentence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddToFavourite &&
            (identical(other.sentence, sentence) ||
                const DeepCollectionEquality()
                    .equals(other.sentence, sentence)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(sentence);

  @JsonKey(ignore: true)
  @override
  $AddToFavouriteCopyWith<AddToFavourite> get copyWith =>
      _$AddToFavouriteCopyWithImpl<AddToFavourite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSentences,
    required TResult Function(Sentence sentence) showNewRandomSentence,
    required TResult Function(Sentence sentence) addToFavourite,
    required TResult Function(Sentence sentence)
        startShowingSentencesFromParticular,
  }) {
    return addToFavourite(sentence);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSentences,
    TResult Function(Sentence sentence)? showNewRandomSentence,
    TResult Function(Sentence sentence)? addToFavourite,
    TResult Function(Sentence sentence)? startShowingSentencesFromParticular,
    required TResult orElse(),
  }) {
    if (addToFavourite != null) {
      return addToFavourite(sentence);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllSentences value) getAllSentences,
    required TResult Function(ShowNewRandomSentence value)
        showNewRandomSentence,
    required TResult Function(AddToFavourite value) addToFavourite,
    required TResult Function(StartShowingSentencesFromParticular value)
        startShowingSentencesFromParticular,
  }) {
    return addToFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllSentences value)? getAllSentences,
    TResult Function(ShowNewRandomSentence value)? showNewRandomSentence,
    TResult Function(AddToFavourite value)? addToFavourite,
    TResult Function(StartShowingSentencesFromParticular value)?
        startShowingSentencesFromParticular,
    required TResult orElse(),
  }) {
    if (addToFavourite != null) {
      return addToFavourite(this);
    }
    return orElse();
  }
}

abstract class AddToFavourite implements SentenceEvent {
  const factory AddToFavourite(Sentence sentence) = _$AddToFavourite;

  Sentence get sentence => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddToFavouriteCopyWith<AddToFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartShowingSentencesFromParticularCopyWith<$Res> {
  factory $StartShowingSentencesFromParticularCopyWith(
          StartShowingSentencesFromParticular value,
          $Res Function(StartShowingSentencesFromParticular) then) =
      _$StartShowingSentencesFromParticularCopyWithImpl<$Res>;
  $Res call({Sentence sentence});
}

/// @nodoc
class _$StartShowingSentencesFromParticularCopyWithImpl<$Res>
    extends _$SentenceEventCopyWithImpl<$Res>
    implements $StartShowingSentencesFromParticularCopyWith<$Res> {
  _$StartShowingSentencesFromParticularCopyWithImpl(
      StartShowingSentencesFromParticular _value,
      $Res Function(StartShowingSentencesFromParticular) _then)
      : super(_value, (v) => _then(v as StartShowingSentencesFromParticular));

  @override
  StartShowingSentencesFromParticular get _value =>
      super._value as StartShowingSentencesFromParticular;

  @override
  $Res call({
    Object? sentence = freezed,
  }) {
    return _then(StartShowingSentencesFromParticular(
      sentence == freezed
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as Sentence,
    ));
  }
}

/// @nodoc

class _$StartShowingSentencesFromParticular
    implements StartShowingSentencesFromParticular {
  const _$StartShowingSentencesFromParticular(this.sentence);

  @override
  final Sentence sentence;

  @override
  String toString() {
    return 'SentenceEvent.startShowingSentencesFromParticular(sentence: $sentence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StartShowingSentencesFromParticular &&
            (identical(other.sentence, sentence) ||
                const DeepCollectionEquality()
                    .equals(other.sentence, sentence)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(sentence);

  @JsonKey(ignore: true)
  @override
  $StartShowingSentencesFromParticularCopyWith<
          StartShowingSentencesFromParticular>
      get copyWith => _$StartShowingSentencesFromParticularCopyWithImpl<
          StartShowingSentencesFromParticular>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllSentences,
    required TResult Function(Sentence sentence) showNewRandomSentence,
    required TResult Function(Sentence sentence) addToFavourite,
    required TResult Function(Sentence sentence)
        startShowingSentencesFromParticular,
  }) {
    return startShowingSentencesFromParticular(sentence);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllSentences,
    TResult Function(Sentence sentence)? showNewRandomSentence,
    TResult Function(Sentence sentence)? addToFavourite,
    TResult Function(Sentence sentence)? startShowingSentencesFromParticular,
    required TResult orElse(),
  }) {
    if (startShowingSentencesFromParticular != null) {
      return startShowingSentencesFromParticular(sentence);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllSentences value) getAllSentences,
    required TResult Function(ShowNewRandomSentence value)
        showNewRandomSentence,
    required TResult Function(AddToFavourite value) addToFavourite,
    required TResult Function(StartShowingSentencesFromParticular value)
        startShowingSentencesFromParticular,
  }) {
    return startShowingSentencesFromParticular(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllSentences value)? getAllSentences,
    TResult Function(ShowNewRandomSentence value)? showNewRandomSentence,
    TResult Function(AddToFavourite value)? addToFavourite,
    TResult Function(StartShowingSentencesFromParticular value)?
        startShowingSentencesFromParticular,
    required TResult orElse(),
  }) {
    if (startShowingSentencesFromParticular != null) {
      return startShowingSentencesFromParticular(this);
    }
    return orElse();
  }
}

abstract class StartShowingSentencesFromParticular implements SentenceEvent {
  const factory StartShowingSentencesFromParticular(Sentence sentence) =
      _$StartShowingSentencesFromParticular;

  Sentence get sentence => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartShowingSentencesFromParticularCopyWith<
          StartShowingSentencesFromParticular>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$SentenceStateTearOff {
  const _$SentenceStateTearOff();

  Initial initial(
      {required List<Sentence> sentences,
      required Sentence actualSentence,
      required bool didActualSentenceChange}) {
    return Initial(
      sentences: sentences,
      actualSentence: actualSentence,
      didActualSentenceChange: didActualSentenceChange,
    );
  }
}

/// @nodoc
const $SentenceState = _$SentenceStateTearOff();

/// @nodoc
mixin _$SentenceState {
  List<Sentence> get sentences => throw _privateConstructorUsedError;
  Sentence get actualSentence => throw _privateConstructorUsedError;
  bool get didActualSentenceChange => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Sentence> sentences, Sentence actualSentence,
            bool didActualSentenceChange)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Sentence> sentences, Sentence actualSentence,
            bool didActualSentenceChange)?
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
  $SentenceStateCopyWith<SentenceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentenceStateCopyWith<$Res> {
  factory $SentenceStateCopyWith(
          SentenceState value, $Res Function(SentenceState) then) =
      _$SentenceStateCopyWithImpl<$Res>;
  $Res call(
      {List<Sentence> sentences,
      Sentence actualSentence,
      bool didActualSentenceChange});
}

/// @nodoc
class _$SentenceStateCopyWithImpl<$Res>
    implements $SentenceStateCopyWith<$Res> {
  _$SentenceStateCopyWithImpl(this._value, this._then);

  final SentenceState _value;
  // ignore: unused_field
  final $Res Function(SentenceState) _then;

  @override
  $Res call({
    Object? sentences = freezed,
    Object? actualSentence = freezed,
    Object? didActualSentenceChange = freezed,
  }) {
    return _then(_value.copyWith(
      sentences: sentences == freezed
          ? _value.sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
      actualSentence: actualSentence == freezed
          ? _value.actualSentence
          : actualSentence // ignore: cast_nullable_to_non_nullable
              as Sentence,
      didActualSentenceChange: didActualSentenceChange == freezed
          ? _value.didActualSentenceChange
          : didActualSentenceChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class $InitialCopyWith<$Res> implements $SentenceStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Sentence> sentences,
      Sentence actualSentence,
      bool didActualSentenceChange});
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$SentenceStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;

  @override
  $Res call({
    Object? sentences = freezed,
    Object? actualSentence = freezed,
    Object? didActualSentenceChange = freezed,
  }) {
    return _then(Initial(
      sentences: sentences == freezed
          ? _value.sentences
          : sentences // ignore: cast_nullable_to_non_nullable
              as List<Sentence>,
      actualSentence: actualSentence == freezed
          ? _value.actualSentence
          : actualSentence // ignore: cast_nullable_to_non_nullable
              as Sentence,
      didActualSentenceChange: didActualSentenceChange == freezed
          ? _value.didActualSentenceChange
          : didActualSentenceChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial(
      {required this.sentences,
      required this.actualSentence,
      required this.didActualSentenceChange});

  @override
  final List<Sentence> sentences;
  @override
  final Sentence actualSentence;
  @override
  final bool didActualSentenceChange;

  @override
  String toString() {
    return 'SentenceState.initial(sentences: $sentences, actualSentence: $actualSentence, didActualSentenceChange: $didActualSentenceChange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Initial &&
            (identical(other.sentences, sentences) ||
                const DeepCollectionEquality()
                    .equals(other.sentences, sentences)) &&
            (identical(other.actualSentence, actualSentence) ||
                const DeepCollectionEquality()
                    .equals(other.actualSentence, actualSentence)) &&
            (identical(
                    other.didActualSentenceChange, didActualSentenceChange) ||
                const DeepCollectionEquality().equals(
                    other.didActualSentenceChange, didActualSentenceChange)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sentences) ^
      const DeepCollectionEquality().hash(actualSentence) ^
      const DeepCollectionEquality().hash(didActualSentenceChange);

  @JsonKey(ignore: true)
  @override
  $InitialCopyWith<Initial> get copyWith =>
      _$InitialCopyWithImpl<Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Sentence> sentences, Sentence actualSentence,
            bool didActualSentenceChange)
        initial,
  }) {
    return initial(sentences, actualSentence, didActualSentenceChange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Sentence> sentences, Sentence actualSentence,
            bool didActualSentenceChange)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(sentences, actualSentence, didActualSentenceChange);
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

abstract class Initial implements SentenceState {
  const factory Initial(
      {required List<Sentence> sentences,
      required Sentence actualSentence,
      required bool didActualSentenceChange}) = _$Initial;

  @override
  List<Sentence> get sentences => throw _privateConstructorUsedError;
  @override
  Sentence get actualSentence => throw _privateConstructorUsedError;
  @override
  bool get didActualSentenceChange => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InitialCopyWith<Initial> get copyWith => throw _privateConstructorUsedError;
}
