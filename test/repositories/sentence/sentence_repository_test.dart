import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/keys.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:netguru_values_generator/reposiories/sentence/sentence_repository_impl.dart';
import 'package:netguru_values_generator/utils/consts.dart';

import '../../utils/fixtures/fixture_reader.dart';
import '../../utils/mocks/shared_prefrences_mock.dart';

void main() {
  late SentenceRepositoryImpl repository;
  late MockSharedPreferences mockSharedPreferences;

  setUpAll(() {
    mockSharedPreferences = MockSharedPreferences();
    repository = SentenceRepositoryImpl(mockSharedPreferences);
  });

  group('getAllSentences', () {
    final tSentences = [
      SentenceDTO(
        '120',
        "Exceed clients' and colleagues' expectations",
        false,
      ),
      SentenceDTO(
          '121',
          "Take ownership and question the status quo in a constructive manner",
          false),
      SentenceDTO(
          '122',
          "Be brave, curious and experiment. Learn from all successes and failures",
          false),
      SentenceDTO(
        '123',
        "Act in a way that makes all of us proud",
        false,
      ),
      SentenceDTO(
          '124',
          "Build an inclusive, transparent and socially responsible culture",
          false),
      SentenceDTO(
        '125',
        "Be ambitious, grow yourself and the people around you",
        false,
      ),
      SentenceDTO(
        '126',
        "Recognize excellence and engagement",
        false,
      ),
    ];

    test('should return list of SentenceDTO if there is list in cache',
        () async {
      when(mockSharedPreferences.getString(any)).thenReturn(
        fixture('sentences.json'),
      );
      final sentences = await repository.getAllSentences();
      verify(mockSharedPreferences.getString(SharedPreferencesKeys.sentences));
      expect(sentences, tSentences);
    });

    test('should throw SentenceException if there is nothing in cache', () {
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      final call = repository.getAllSentences;
      expect(
        () => call(),
        throwsA(
          SentenceException(
            message: SentenceErrorMessages.noSentences,
          ),
        ),
      );
    });
  });

  group('saveSentence', () {
    final tSentence = SentenceDTO(
      '120',
      "Exceed clients' and colleagues' expectations",
      true,
    );
    final updatedExistingSentences = [
      {
        "uid": "120",
        "value": "Exceed clients' and colleagues' expectations",
        "isFavourite": true
      },
      {
        "uid": "121",
        "value":
            "Take ownership and question the status quo in a constructive manner",
        "isFavourite": false
      },
      {
        "uid": "122",
        "value":
            "Be brave, curious and experiment. Learn from all successes and failures",
        "isFavourite": false
      },
      {
        "uid": "123",
        "value": "Act in a way that makes all of us proud",
        "isFavourite": false
      },
      {
        "uid": "124",
        "value":
            "Build an inclusive, transparent and socially responsible culture",
        "isFavourite": false
      },
      {
        "uid": "125",
        "value": "Be ambitious, grow yourself and the people around you",
        "isFavourite": false
      },
      {
        "uid": "126",
        "value": "Recognize excellence and engagement",
        "isFavourite": false,
      }
    ];

    final tNotValidSentence =
        SentenceDTO('123', 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu', true);
    test('should throw SentenceException with message if sentence is not valid',
        () async {
      final call = repository.saveSentence;

      expect(
        () => call(tNotValidSentence),
        throwsA(
          SentenceException(
            message: SentenceErrorMessages.sentenceValueIsNotValid,
          ),
        ),
      );
    });

    test(
        'should return SentenceDTO if successfully saved when sentence was in list',
        () async {
      when(mockSharedPreferences.getString(any)).thenReturn(
        fixture('sentences.json'),
      );
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => true);
      final sentence = await repository.saveSentence(tSentence);
      final expectedJsonString = json.encode(updatedExistingSentences);
      verify(mockSharedPreferences.setString(
        SharedPreferencesKeys.sentences,
        expectedJsonString,
      ));
      verify(mockSharedPreferences.getString(SharedPreferencesKeys.sentences));
      expect(
        sentence,
        SentenceDTO.fromJson(updatedExistingSentences[0]),
      );
    });

    test(
        'should throw SentenceException if unsuccessfully saved when sentence was in list',
        () async {
      when(mockSharedPreferences.getString(any)).thenReturn(
        fixture('sentences.json'),
      );
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => false);
      final call = repository.saveSentence;

      expect(
        () => call(tSentence),
        throwsA(
          SentenceException(
            message: SentenceErrorMessages.cantSaveSentence,
          ),
        ),
      );
    });

    final tNewSentence = SentenceDTO(
      '127',
      "Make requirement task as best as you can",
      false,
    );
    final existingSentencesWithNewOne = [
      {
        "uid": "120",
        "value": "Exceed clients' and colleagues' expectations",
        "isFavourite": false
      },
      {
        "uid": "121",
        "value":
            "Take ownership and question the status quo in a constructive manner",
        "isFavourite": false
      },
      {
        "uid": "122",
        "value":
            "Be brave, curious and experiment. Learn from all successes and failures",
        "isFavourite": false
      },
      {
        "uid": "123",
        "value": "Act in a way that makes all of us proud",
        "isFavourite": false
      },
      {
        "uid": "124",
        "value":
            "Build an inclusive, transparent and socially responsible culture",
        "isFavourite": false
      },
      {
        "uid": "125",
        "value": "Be ambitious, grow yourself and the people around you",
        "isFavourite": false
      },
      {
        "uid": "126",
        "value": "Recognize excellence and engagement",
        "isFavourite": false,
      },
      {
        "uid": "127",
        "value": "Make requirement task as best as you can",
        "isFavourite": false,
      }
    ];

    test(
        'should return SentenceDTO if successfully saved when sentence was not in list',
        () async {
      when(mockSharedPreferences.getString(any)).thenReturn(
        fixture('sentences.json'),
      );
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => true);
      final sentence = await repository.saveSentence(tNewSentence);
      final expectedJsonString = json.encode(existingSentencesWithNewOne);
      verify(mockSharedPreferences.getString(SharedPreferencesKeys.sentences));
      verify(mockSharedPreferences.setString(
        SharedPreferencesKeys.sentences,
        expectedJsonString,
      ));
      expect(
        sentence,
        SentenceDTO.fromJson(
          existingSentencesWithNewOne.last,
        ),
      );
    });

    test(
        'should throw SentenceException if unsuccessfully saved when sentence was not in list',
        () async {
      when(mockSharedPreferences.getString(any)).thenReturn(
        fixture('sentences.json'),
      );
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => false);
      final call = repository.saveSentence;

      expect(
        () => call(tNewSentence),
        throwsA(
          SentenceException(
            message: SentenceErrorMessages.cantSaveSentence,
          ),
        ),
      );
    });
  });

  group('replaceAll', () {
    final sentences = [
      SentenceDTO('123', 'value1', true),
      SentenceDTO('124', 'value2', true),
    ];
    final sentencesMap = [
      {"uid": "123", "value": "value1", "isFavourite": true},
      {"uid": "124", "value": "value2", "isFavourite": true}
    ];

    test('should perform a setString on particular key', () async {
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => true);
      await repository.replaceAll(sentences);
      verify(
        mockSharedPreferences.setString(
          SharedPreferencesKeys.sentences,
          json.encode(sentencesMap),
        ),
      );
    });

    test('should throw a SentenceException if could not replaceAll', () async {
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => false);
      final call = repository.replaceAll;

      expect(
        () => call(sentences),
        throwsA(
          SentenceException(
            message: SentenceErrorMessages.cantReplaceAllSentences,
          ),
        ),
      );
    });
  });

  group('areSentencesValuesValid', () {
    final sentences = [
      SentenceDTO('123', 'value1', true),
      SentenceDTO('124', 'value2', true),
    ];

    final notValidSentences = [
      SentenceDTO('123', 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu', true),
      SentenceDTO('124', 'value2', true),
    ];

    test('should return true if values are valid', () {
      final areValid = repository.areSentencesValuesValid(sentences);
      expect(areValid, true);
    });

    test('should return false if one of values are not valid', () {
      final areValid = repository.areSentencesValuesValid(notValidSentences);
      expect(areValid, false);
    });
  });

  group('validateSentence', () {
    final validSentence = SentenceDTO('123', 'value1', true);
    final notValidSentence1 =
        SentenceDTO('123', 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu', true);
    final notValidSentence2 = SentenceDTO(
        '123', 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBCaWdJbnRlZ2Vy', true);
    final notValidSentence3 =
        SentenceDTO('123', 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBEb3VibGUu', true);
    final notValidSentence4 = SentenceDTO('123', '', true);

    test('should return true if sentence is valid', () {
      final isValid = repository.validateSentence(validSentence);
      expect(isValid, true);
    });
    test('should return false if sentence is not valid 1', () {
      final isValid = repository.validateSentence(notValidSentence1);
      expect(isValid, false);
    });
    test('should return false if sentence is not valid 2', () {
      final isValid = repository.validateSentence(notValidSentence2);
      expect(isValid, false);
    });
    test('should return false if sentence is not valid 3', () {
      final isValid = repository.validateSentence(notValidSentence3);
      expect(isValid, false);
    });
    test('should return false if sentence is not valid - empty value', () {
      final isValid = repository.validateSentence(notValidSentence4);
      expect(isValid, false);
    });
  });

  group('getFavouriteSentences', () {
    final tFavouritesSentences = [
      SentenceDTO(
        '120',
        "Exceed clients' and colleagues' expectations",
        true,
      ),
      SentenceDTO(
        '126',
        "Recognize excellence and engagement",
        true,
      ),
    ];

    test('should return favourite sentences', () async {
      when(mockSharedPreferences.getString(any)).thenReturn(
        fixture('sentences_with_favourites.json'),
      );
      final favourites = await repository.getFavouriteSentences();
      verify(mockSharedPreferences.getString(SharedPreferencesKeys.sentences));
      expect(favourites, tFavouritesSentences);
    });

    test('should throw exception if there is no favourites', () async {
      when(mockSharedPreferences.getString(any)).thenReturn(
        fixture('sentences.json'),
      );
      final call = repository.getFavouriteSentences;
      expect(
          () => call(),
          throwsA(
            SentenceException(
              message: SentenceErrorMessages.noFavouriteSentences,
            ),
          ));
    });

    test('should throw exception if there is no sentences at all', () async {
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      final call = repository.getFavouriteSentences;
      expect(
          () => call(),
          throwsA(
            SentenceException(
              message: SentenceErrorMessages.noSentences,
            ),
          ));
    });
  });

  group('findByUid', () {
    test(
        'should return SentenceDTO if there is one with particular uid', () {});
  });
}
