
part of 'all_sentences_bloc.dart';

@freezed
class AllSentencesEvent with _$AllSentencesEvent {
  const factory AllSentencesEvent.getAllSentences() = GetAllSentences;
}