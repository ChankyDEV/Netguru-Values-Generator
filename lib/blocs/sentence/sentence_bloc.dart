import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/services/sentence/sentence_service.dart';

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
            actualSentence: Sentence('', false),
            didActualSentenceChange: false,
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
      startShowingSentencesFromParticular: startShowingSentencesFromParticular,
    );
  }

  Stream<SentenceState> _getAllSentences(GetAllSentences value) async* {
    final failureOrSentences = await _sentenceService.getAllSentences();
    yield failureOrSentences.fold<SentenceState>(
      (l) => _showError(l),
      (r) => _startShowingSentences(r),
    );
  }

  SentenceState _showError(Failure error) {
    return state;
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
    );
  }

  Stream<SentenceState> _showRandomSentence(ShowNewRandomSentence e) async* {
    yield state.copyWith(
      actualSentence: e.sentence,
      didActualSentenceChange: false,
    );
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }

  Stream<SentenceState> _addToFavourite(AddToFavourite e) async* {
    e.sentence.changeFavouriteStatus();
    final failureOrSavedSentence =
        await _sentenceService.saveSentence(e.sentence);
    yield failureOrSavedSentence.fold<SentenceState>(
      (l) => _showError(l),
      (r) => _updateSentences(r),
    );
  }

  _updateSentences(Sentence sentence) {
    final index = state.sentences.indexWhere(
      (element) => element.uid == sentence.uid,
    );
    state.sentences[index] = sentence;
    return state.copyWith(
      sentences: state.sentences,
      actualSentence: state.actualSentence,
      didActualSentenceChange: true,
    );
  }

  Stream<SentenceState> startShowingSentencesFromParticular(
      StartShowingSentencesFromParticular e) async* {
    this.add(
      SentenceEvent.showNewRandomSentence(
        e.sentence,
      ),
    );
    final random = Random();
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      int randomIndex = random.nextInt(state.sentences.length);
      this.add(
        SentenceEvent.showNewRandomSentence(
          state.sentences[randomIndex],
        ),
      );
    });

    yield state.copyWith(
      sentences: state.sentences,
    );
  }
}
