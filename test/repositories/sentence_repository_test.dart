import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:netguru_values_generator/reposiories/sentence/sentence_repository.dart';
import 'package:netguru_values_generator/reposiories/sentence/sentence_repository_impl.dart';

import '../utils/fixtures/fixture_reader.dart';
import '../utils/mocks/shared_prefrences_mock.dart';

void main() {
  late SentenceRepository repository;
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
      verify(mockSharedPreferences.getString(SENTENCES));
      expect(sentences, tSentences);
    });

    test('should throw SentenceException if there is nothing in cache', () {
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      final call = repository.getAllSentences;
      expect(
        () => call(),
        throwsA(TypeMatcher<SentenceException>()),
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

    test(
        'should return SentenceDTO if successfully saved when sentence was in favourites',
        () async {
      when(mockSharedPreferences.getString(any)).thenReturn(
        fixture('sentences.json'),
      );
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => true);
      final sentence = await repository.saveSentence(tSentence);
      final expectedJsonString = json.encode(updatedExistingSentences);
      verify(mockSharedPreferences.setString(
        SENTENCES,
        expectedJsonString,
      ));
      verify(mockSharedPreferences.getString(SENTENCES));
      expect(
        sentence,
        SentenceDTO.fromJson(updatedExistingSentences[0]),
      );
    });

    test(
        'should throw SentenceException if unsuccessfully saved when sentence was in favourites',
        () async {
      when(mockSharedPreferences.getString(any)).thenReturn(
        fixture('sentences.json'),
      );
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => false);
      final call = repository.saveSentence;

      expect(
        () => call(tSentence),
        throwsA(TypeMatcher<SentenceException>()),
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
      verify(mockSharedPreferences.getString(SENTENCES));
      verify(mockSharedPreferences.setString(
        SENTENCES,
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
        throwsA(TypeMatcher<SentenceException>()),
      );
    });
  });
}
