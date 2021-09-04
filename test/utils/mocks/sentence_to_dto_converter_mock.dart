import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/converters/sentence/sentence_to_dto_converter.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';

class MockSentenceToDtoConverter extends Mock
    implements SentenceToDtoConverter {
  @override
  SentenceDTO convert(Sentence? sentence) {
    return super.noSuchMethod(
      Invocation.method(#convert, [sentence]),
      returnValueForMissingStub: SentenceDTO('', '', false),
      returnValue: SentenceDTO('', '', false),
    );
  }

  @override
  List<SentenceDTO> convertAll(List<Sentence>? sentences) {
    return super.noSuchMethod(
      Invocation.method(#convert, [sentences]),
      returnValueForMissingStub: [SentenceDTO('', '', false)],
      returnValue: [SentenceDTO('', '', false)],
    );
  }
}
