import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:uuid/uuid.dart';

class SentenceToDtoConverter {
  final Uuid _generator;

  SentenceToDtoConverter(this._generator);

  SentenceDTO convert(Sentence sentence) {
    final uid = _generator.v4();
    return SentenceDTO(
      uid,
      sentence.value,
      sentence.isFavourite,
    );
  }
}
