import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:netguru_values_generator/services/sentence_service.dart';
import 'package:netguru_values_generator/services/sentence_service_impl.dart';
import 'package:netguru_values_generator/utils/consts.dart';

import '../utils/mocks/sentence_repository_mock.dart';

void main() async {
  late SentenceService service;
  late MockSentenceRepository repository;

  const sentenceToSave = Sentence('value1', true);
  final tSentences = [
    SentenceDTO('value1', true),
    SentenceDTO('value2', true),
    SentenceDTO('value3', true),
  ];

  setUpAll(() {
    repository = MockSentenceRepository();
    service = SentenceServiceImpl(repository);
  });

  group('getAllSentences', () {
    test('should return right with list of sentences if everything went well',
        () async {
      when(repository.getAllSentences()).thenAnswer((_) async => tSentences);
      final sentences = await service.getAllSentences();
      verify(repository.getAllSentences());
      expect(
        sentences,
        right(tSentences),
      );
    });

    test(
        'should return left with sentence failure when repository throws sentence exception',
        () async {
      when(repository.getAllSentences()).thenThrow(SentenceException());
      final sentences = await service.getAllSentences();
      verify(repository.getAllSentences());
      expect(
        sentences,
        left(Failure(
          ErrorMessages.sentences.cantGetSentences,
        )),
      );
    });
  });

  group('saveSentence', () {
    test('should return right(Sentence) if saved sentence properly', () async {
      when(repository.saveSentence(any)).thenAnswer((_) async => tSentences[0]);
      final sentence = await service.saveSentence(sentenceToSave);

      verify(
        repository.saveSentence(
          SentenceDTO.fromDomain(sentenceToSave),
        ),
      );
      expect(
        sentence,
        right(tSentences[0]),
      );
    });

    test('should return left(Failure) if saved sentence went unsuccessfully',
        () async {
      when(repository.saveSentence(any)).thenThrow(SentenceException());
      final sentence = await service.saveSentence(sentenceToSave);
      verify(
        repository.saveSentence(
          SentenceDTO.fromDomain(sentenceToSave),
        ),
      );
      expect(
        sentence,
        left(
          Failure(
            ErrorMessages.sentences.cantSaveSentence,
          ),
        ),
      );
    });
  });
}
