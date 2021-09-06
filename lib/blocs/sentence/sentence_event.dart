part of 'sentence_bloc.dart';

@freezed
class SentenceEvent with _$SentenceEvent {
  const factory SentenceEvent.getAllSentences() = GetAllSentences;

  const factory SentenceEvent.showNewRandomSentence(Sentence sentence) =
      ShowNewRandomSentence;

  const factory SentenceEvent.addToFavourite(Sentence sentence) =
      AddToFavourite;

  const factory SentenceEvent.newSentenceValueChanged(String value) =
      NewSentenceValueChanged;

  const factory SentenceEvent.createNewSentence() = CreateNewSentence;

  const factory SentenceEvent.reload() = Reload;

  const factory SentenceEvent.clearNewSentenceValue() = ClearNewSentenceValue;

  const factory SentenceEvent.reset() = Reset;
}
