class SentenceErrorMessages {
  final cantGetSentences = 'Could not get all sentences';
  final cantSaveSentence = 'Could not save a sentences';
}

mixin ErrorMessages {
  static final sentences = SentenceErrorMessages();
}
