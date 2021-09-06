import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:uuid/uuid.dart';

class SentenceConverter {
  final Uuid _generator;

  SentenceConverter(this._generator);

  SentenceDTO convertToDto(Sentence sentence) => _convertToDto(sentence);

  List<SentenceDTO> convertAllToDtos(List<Sentence> sentences) {
    final dtos = <SentenceDTO>[];
    sentences.forEach((sentence) {
      dtos.add(
        _convertToDto(sentence),
      );
    });
    return dtos;
  }

  SentenceDTO _convertToDto(Sentence sentence) {
    final uid = sentence.uid.isEmpty ? _generator.v4() : sentence.uid;
    final dto = SentenceDTO(
      uid,
      sentence.value,
      sentence.isFavourite,
    );
    return dto;
  }

  Sentence convertFromDto(SentenceDTO dto) => _convertFromDto(dto);

  List<Sentence> convertAllFromDtos(List<SentenceDTO> dtos) {
    final sentences = <Sentence>[];
    dtos.forEach((dto) {
      sentences.add(
        _convertFromDto(dto),
      );
    });
    return sentences;
  }

  Sentence _convertFromDto(SentenceDTO dto) {
    return Sentence(dto.uid, dto.value, dto.isFavourite);
  }
}
