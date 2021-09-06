import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/services/sentence/sentence_service.dart';

part 'all_sentences_bloc.freezed.dart';

part 'all_sentences_event.dart';

part 'all_sentences_state.dart';

class AllSentencesBloc extends Bloc<AllSentencesEvent, AllSentencesState> {
  final SentenceService _sentenceService;

  AllSentencesBloc(
    this._sentenceService,
  ) : super(
          AllSentencesState.initial(
            sentences: <Sentence>[],
            hasErrors: false,
            isLoading: true,
          ),
        );

  @override
  Stream<AllSentencesState> mapEventToState(AllSentencesEvent event) async* {
    yield* event.map(getAllSentences: _getAllSentences);
  }

  Stream<AllSentencesState> _getAllSentences(GetAllSentences value) async* {
    final failureOrSentences = await _sentenceService.getAllSentences();
    yield failureOrSentences.fold<AllSentencesState>(
      (l) => _showError(l),
      (r) => _showAllSentences(r),
    );
  }

  void getAllSentences() {
    this.add(
      AllSentencesEvent.getAllSentences(),
    );
  }

  AllSentencesState _showAllSentences(List<Sentence> allSentences) {
    return state.copyWith(
      sentences: allSentences,
      isLoading: false,
    );
  }

  AllSentencesState _showError(Failure f) {
    return state.copyWith(
      isLoading: false,
      hasErrors: true,
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
