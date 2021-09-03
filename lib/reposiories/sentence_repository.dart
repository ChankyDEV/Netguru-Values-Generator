import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';

abstract class SentenceRepository {
  Future<List<SentenceDTO>> getAllSentences();

  Future<SentenceDTO> saveSentence(SentenceDTO sentence);
}
