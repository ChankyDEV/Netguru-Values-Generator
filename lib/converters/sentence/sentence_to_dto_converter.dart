import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:uuid/uuid.dart';

class SentenceToDtoConverter {
  final Uuid _generator;

  SentenceToDtoConverter(this._generator);

  SentenceDTO convert(Sentence sentence) => _convert(sentence);

  List<SentenceDTO> convertAll(List<Sentence> sentences) {
    final uid = _generator.v4();
    final dtos = <SentenceDTO>[];
    sentences.forEach((sentence) {
      dtos.add(
        _convert(sentence),
      );
    });
    return dtos;
  }

  SentenceDTO _convert(Sentence sentence) {
    final uid = _generator.v4();
    return SentenceDTO(
      uid,
      sentence.value,
      sentence.isFavourite,
    );
  }
}
