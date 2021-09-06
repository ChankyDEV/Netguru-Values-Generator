import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/services/sentence/sentence_service.dart';
import 'package:netguru_values_generator/utils/consts.dart';

part 'sentence_bloc.freezed.dart';

part 'sentence_event.dart';

part 'sentence_state.dart';

class SentenceBloc extends Bloc<SentenceEvent, SentenceState> {
  final SentenceService _sentenceService;
  late Timer timer;

  SentenceBloc(this._sentenceService)
      : super(
          SentenceState.initial(
            sentences: [],
            actualSentence: Sentence('', '', false),
            didActualSentenceChange: false,
            newSentenceValue: '',
            hasError: false,
            showSnackBar: false,
            isLoading: true,
            isRetryButtonClicked: false,
            errorMessage: '',
          ),
        );

  void getInitialSentences() {
    this.add(SentenceEvent.getAllSentences());
  }

  @override
  Stream<SentenceState> mapEventToState(SentenceEvent event) async* {
    yield* event.map(
      getAllSentences: _getAllSentences,
      showNewRandomSentence: _showRandomSentence,
      addToFavourite: _addToFavourite,
      newSentenceValueChanged: _newSentenceValueChanged,
      createNewSentence: _createNewSentence,
      reload: _reload,
      clearNewSentenceValue: _clearNewSentenceValue,
      reset: _reset,
    );
  }

  Stream<SentenceState> _getAllSentences(GetAllSentences value) async* {
    final failureOrSentences = await _sentenceService.getAllSentences();
    yield failureOrSentences.fold<SentenceState>(
      (l) => _processError(l),
      (r) => _startShowingSentences(r),
    );
  }

  SentenceState _processError(Failure error) {
    if (error.message == SentenceErrorMessages.sentenceValueIsNotValid) {
      return state.copyWith(
        showSnackBar: true,
        errorMessage: error.message,
      );
    }
    return state.copyWith(
      hasError: true,
      errorMessage: error.message,
    );
  }

  SentenceState _startShowingSentences(List<Sentence> sentences) {
    this.add(
      SentenceEvent.showNewRandomSentence(
        sentences[0],
      ),
    );
    final random = Random();
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      int randomIndex = random.nextInt(sentences.length);
      this.add(
        SentenceEvent.showNewRandomSentence(
          sentences[randomIndex],
        ),
      );
    });

    return state.copyWith(
      sentences: sentences,
      isLoading: false,
    );
  }

  Stream<SentenceState> _showRandomSentence(ShowNewRandomSentence e) async* {
    yield state.copyWith(
      actualSentence: e.sentence,
      didActualSentenceChange: false,
    );
  }

  Stream<SentenceState> _addToFavourite(AddToFavourite e) async* {
    e.sentence.changeFavouriteStatus();
    final failureOrSavedSentence =
        await _sentenceService.saveSentence(e.sentence);
    yield failureOrSavedSentence.fold<SentenceState>(
      (l) => _processError(l),
      (r) {
        print(r.uid + 'xdddddddddddd2');
        return _updateSentences(r);
      },
    );
  }

  SentenceState _updateSentences(Sentence sentence) {
    final index = state.sentences.indexWhere(
      (element) => element.uid == sentence.uid,
    );
    if (index != -1) {
      state.sentences[index] = sentence;
    } else {
      state.sentences.add(sentence);
    }
    return state.copyWith(
      sentences: state.sentences,
      actualSentence: state.actualSentence,
      didActualSentenceChange: true,
      newSentenceValue: '',
    );
  }

  Stream<SentenceState> _newSentenceValueChanged(
    NewSentenceValueChanged e,
  ) async* {
    yield state.copyWith(newSentenceValue: e.value);
    print(e.value);
  }

  Stream<SentenceState> _createNewSentence(CreateNewSentence e) async* {
    final sentence = Sentence('', state.newSentenceValue, false);
    final failureOrSentence = await _sentenceService.saveSentence(sentence);
    yield failureOrSentence.fold<SentenceState>(
      (l) => _processError(l),
      (r) => _updateSentences(r),
    );
  }

  Stream<SentenceState> _reload(Reload value) async* {
    yield _tapOrReleaseRetryButton();
    await Future.delayed(const Duration(seconds: 2));
    yield* _allSentences();
    yield _tapOrReleaseRetryButton();
  }

  Stream<SentenceState> _allSentences() async* {
    final failureOrSentences = await _sentenceService.getAllSentences();
    yield failureOrSentences.fold<SentenceState>(
      (l) => _processError(l),
      (r) => _startShowingSentences(r),
    );
  }

  SentenceState _tapOrReleaseRetryButton() {
    return state.copyWith(
      isRetryButtonClicked: !state.isRetryButtonClicked,
      hasError: false,
    );
  }

  Stream<SentenceState> _clearNewSentenceValue(
      ClearNewSentenceValue value) async* {
    state.copyWith(
      newSentenceValue: '',
    );
  }

  Stream<SentenceState> _reset(Reset value) async* {
    yield SentenceState.initial(
      sentences: state.sentences,
      actualSentence: state.actualSentence,
      didActualSentenceChange: false,
      isLoading: false,
      newSentenceValue: '',
      hasError: false,
      isRetryButtonClicked: false,
      errorMessage: '',
      showSnackBar: false,
    );
  }
}
