import 'package:netguru_values_generator/models/sentence_dto.dart';

abstract class SentenceRepository {
  Future<List<SentenceDTO>> getAllSentences();

  Future<List<SentenceDTO>> getFavouriteSentences();

  Future<SentenceDTO> saveSentence(SentenceDTO sentence);

  Future<void> replaceAll(List<SentenceDTO> sentences);
}
