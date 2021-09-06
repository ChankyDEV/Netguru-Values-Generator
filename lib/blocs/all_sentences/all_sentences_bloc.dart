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
            hasError: false,
            isLoading: true,
            isRetryButtonClicked: false,
          ),
        );

  @override
  Stream<AllSentencesState> mapEventToState(AllSentencesEvent event) async* {
    yield* event.map(
      getAllSentences: _getAllSentences,
      reload: _reload,
    );
  }

  Stream<AllSentencesState> _getAllSentences(GetAllSentences value) async* {
    yield* _allSentences();
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
      hasError: false,
    );
  }

  AllSentencesState _showError(Failure f) {
    return state.copyWith(
      isLoading: false,
      hasError: true,
    );
  }

  Stream<AllSentencesState> _allSentences() async* {
    final failureOrSentences = await _sentenceService.getAllSentences();
    yield failureOrSentences.fold<AllSentencesState>(
      (l) => _showError(l),
      (r) => _showAllSentences(r),
    );
  }

  Stream<AllSentencesState> _reload(Reload value) async* {
    yield _tapOrReleaseRetryButton();
    await Future.delayed(const Duration(seconds: 2));
    yield* _allSentences();
    yield _tapOrReleaseRetryButton();
  }

  AllSentencesState _tapOrReleaseRetryButton() {
    return state.copyWith(
      isRetryButtonClicked: !state.isRetryButtonClicked,
    );
  }
}
