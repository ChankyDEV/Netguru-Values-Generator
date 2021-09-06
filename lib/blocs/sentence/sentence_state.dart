part of 'sentence_bloc.dart';

@freezed
class SentenceState with _$SentenceState {
  const factory SentenceState.initial({
    required List<Sentence> sentences,
    required Sentence actualSentence,
    required bool didActualSentenceChange,
    required bool isLoading,
    required String newSentenceValue,
    required bool hasError,
    required bool isRetryButtonClicked,
    required String errorMessage,
    required bool showSnackBar,
  }) = Initial;
}
