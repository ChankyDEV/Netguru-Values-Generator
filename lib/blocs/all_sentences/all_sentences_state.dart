part of 'all_sentences_bloc.dart';

@freezed
class AllSentencesState with _$AllSentencesState {
  const factory AllSentencesState.initial({
    required List<Sentence> sentences,
    required bool hasErrors,
    required bool isLoading,
  }) = Initial;
}
