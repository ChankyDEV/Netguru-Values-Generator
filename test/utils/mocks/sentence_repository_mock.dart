import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:netguru_values_generator/reposiories/sentence/sentence_repository.dart';

class MockSentenceRepository extends Mock implements SentenceRepository {
  @override
  Future<List<SentenceDTO>> getAllSentences() {
    return super.noSuchMethod(
      Invocation.method(#getAllSentences, null),
      returnValueForMissingStub: Future.value(<SentenceDTO>[]),
      returnValue: Future.value(<SentenceDTO>[]),
    );
  }

  @override
  Future<SentenceDTO> saveSentence(SentenceDTO? sentence) {
    return super.noSuchMethod(
      Invocation.method(#saveSentence, [sentence]),
      returnValueForMissingStub: Future.value(
        SentenceDTO('', '', true),
      ),
      returnValue: Future.value(
        SentenceDTO('', '', true),
      ),
    );
  }

  @override
  Future<void> replaceAll(List<SentenceDTO>? sentences) {
    return super.noSuchMethod(
      Invocation.method(#replaceAll, [sentences]),
      returnValueForMissingStub: Future.value(),
      returnValue: Future.value(),
    );
  }

  @override
  Future<List<SentenceDTO>> getFavouriteSentences() {
    return super.noSuchMethod(
      Invocation.method(#getFavouriteSentences, null),
      returnValueForMissingStub: Future.value(<SentenceDTO>[]),
      returnValue: Future.value(<SentenceDTO>[]),
    );
  }
}
