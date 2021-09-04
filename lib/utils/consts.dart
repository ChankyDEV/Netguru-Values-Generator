class SentenceErrorMessages {
  final cantGetSentences = 'Could not get all sentences';
  final cantSaveSentence = 'Could not save a sentence';
  final cantReplaceAllSentences = 'Could not save all sentences';
  final noFavouriteSentences = 'There is no favourite sentences in database';
  final sentenceValueIsNotValid = 'Sentence value is not valid';
  final noSentences = 'There is no sentences in database';
}

mixin ErrorMessages {
  static final sentences = SentenceErrorMessages();
}
