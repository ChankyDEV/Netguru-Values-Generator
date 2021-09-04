import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:netguru_values_generator/services/sentence/sentence_service.dart';
import 'package:netguru_values_generator/services/sentence/sentence_service_impl.dart';
import 'package:netguru_values_generator/utils/consts.dart';

import '../../utils/mocks/sentence_repository_mock.dart';
import '../../utils/mocks/sentence_to_dto_converter_mock.dart';

void main() async {
  late SentenceService service;
  late MockSentenceRepository repository;
  late MockSentenceToDtoConverter converter;

  final sentenceToSave = Sentence(
    'value1',
    true,
  );
  final saveSentenceWithUid = SentenceDTO('120', 'value1', true);

  final tSentenceDtos = [
    SentenceDTO('120', 'value1', true),
    SentenceDTO('121', 'value2', true),
    SentenceDTO('122', 'value3', true),
  ];

  final tSentences = [
    Sentence.withUid('120', 'value1', true),
    Sentence.withUid('121', 'value2', true),
    Sentence.withUid('122', 'value3', true),
  ];

  setUpAll(() {
    converter = MockSentenceToDtoConverter();
    repository = MockSentenceRepository();
    service = SentenceServiceImpl(repository, converter);
  });

  group('getAllSentences', () {
    test('should return right with list of sentences if everything went well',
        () async {
      when(repository.getAllSentences()).thenAnswer((_) async => tSentenceDtos);
      when(converter.convertAllFromDtos(any)).thenReturn(tSentences);
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
        left(
          const Failure(
            SentenceErrorMessages.cantGetSentences,
          ),
        ),
      );
    });
  });

  group('saveSentence', () {
    test('should return right(Sentence) if saved sentence properly', () async {
      when(repository.saveSentence(any))
          .thenAnswer((_) async => tSentenceDtos[0]);
      when(converter.convertToDto(any)).thenReturn(saveSentenceWithUid);
      when(converter.convertFromDto(any)).thenReturn(tSentences[0]);
      final sentence = await service.saveSentence(sentenceToSave);

      verify(converter.convertToDto(sentenceToSave));
      expect(
        sentence,
        right(tSentences[0]),
      );
    });

    test('should return left(Failure) if saved sentence went unsuccessfully',
        () async {
      when(repository.saveSentence(any)).thenThrow(SentenceException());
      when(converter.convertToDto(any)).thenReturn(saveSentenceWithUid);
      final sentence = await service.saveSentence(sentenceToSave);

      verify(converter.convertToDto(sentenceToSave));
      expect(
        sentence,
        left(
          const Failure(
            SentenceErrorMessages.cantSaveSentence,
          ),
        ),
      );
    });
  });

  group('replaceAll', () {
    final tListSentences = <Sentence>[Sentence('value', false)];
    final tListDtos = <SentenceDTO>[SentenceDTO('123', 'value', false)];
    test('should return unit if successfully replaced list in cache', () async {
      when(converter.convertAllToDtos(any)).thenReturn(tListDtos);
      when(repository.replaceAll(any)).thenAnswer((_) async => null);
      final result = await service.replaceAll(tListSentences);
      verify(converter.convertAllToDtos(tListSentences));
      verify(repository.replaceAll(tListDtos));
      expect(result, right(unit));
    });

    test('should return failure if unsuccessfully replaced list in cache',
        () async {
      when(converter.convertAllToDtos(any)).thenReturn(tListDtos);
      when(repository.replaceAll(any)).thenThrow(SentenceException());
      final result = await service.replaceAll(tListSentences);
      verify(converter.convertAllToDtos(tListSentences));
      verify(repository.replaceAll(tListDtos));
      expect(
        result,
        left(
          const Failure(SentenceErrorMessages.cantReplaceAllSentences),
        ),
      );
    });
  });

  final tFavouritesDtos = [
    SentenceDTO('123', 'value1', true),
    SentenceDTO('124', 'value2', true),
  ];

  final tFavourites = [
    Sentence.withUid('123', 'value1', true),
    Sentence.withUid('124', 'value2', true),
  ];

  group('getFavourites', () {
    test('should return right list of sentences if successfully can get them',
        () async {
      when(repository.getFavouriteSentences())
          .thenAnswer((_) async => tFavouritesDtos);
      when(converter.convertAllFromDtos(any)).thenReturn(tFavourites);
      final result = await service.getFavouriteSentences();
      verify(repository.getFavouriteSentences());
      expect(
        result,
        right(tFavourites),
      );
    });

    test('should return left failure with message if there is no favourites',
        () async {
      when(repository.getFavouriteSentences()).thenThrow(
        SentenceException(
          message: SentenceErrorMessages.noFavouriteSentences,
        ),
      );
      final result = await service.getFavouriteSentences();
      verify(repository.getFavouriteSentences());
      expect(
        result,
        left(
          const Failure(SentenceErrorMessages.noFavouriteSentences),
        ),
      );
    });

    test(
        'should return left failure with message if there were problem to get them',
        () async {
      when(repository.getFavouriteSentences()).thenThrow(
        SentenceException(
          message: SentenceErrorMessages.cantGetSentences,
        ),
      );
      final result = await service.getFavouriteSentences();
      verify(repository.getFavouriteSentences());
      expect(
        result,
        left(
          const Failure(SentenceErrorMessages.cantGetSentences),
        ),
      );
    });
  });
}
