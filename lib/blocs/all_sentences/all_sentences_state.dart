part of 'all_sentences_bloc.dart';

@freezed
class AllSentencesState with _$AllSentencesState {
  const factory AllSentencesState.initial({
    required List<Sentence> sentences,
    required bool hasError,
    required bool isLoading,
    required bool isRetryButtonClicked,
  }) = Initial;
}
