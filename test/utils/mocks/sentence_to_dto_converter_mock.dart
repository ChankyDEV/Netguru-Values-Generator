import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/converters/sentence/sentence_converter.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';

class MockSentenceToDtoConverter extends Mock implements SentenceConverter {
  @override
  SentenceDTO convertToDto(Sentence? sentence) {
    return super.noSuchMethod(
      Invocation.method(#convert, [sentence]),
      returnValueForMissingStub: SentenceDTO('', '', false),
      returnValue: SentenceDTO('', '', false),
    );
  }

  @override
  List<SentenceDTO> convertAllToDtos(List<Sentence>? sentences) {
    return super.noSuchMethod(
      Invocation.method(#convert, [sentences]),
      returnValueForMissingStub: [SentenceDTO('', '', false)],
      returnValue: [SentenceDTO('', '', false)],
    );
  }

  @override
  Sentence convertFromDto(SentenceDTO? dto) {
    return super.noSuchMethod(
      Invocation.method(#convertFromDto, [dto]),
      returnValueForMissingStub: Sentence('', false),
      returnValue: Sentence('', false),
    );
  }

  @override
  List<Sentence> convertAllFromDtos(List<SentenceDTO>? dtos) {
    return super.noSuchMethod(
      Invocation.method(#convertAllFromDtos, [dtos]),
      returnValueForMissingStub: [Sentence('', false)],
      returnValue: [Sentence('', false)],
    );
  }
}
