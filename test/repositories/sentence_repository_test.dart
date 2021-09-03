import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:netguru_values_generator/reposiories/sentence_repository.dart';
import 'package:netguru_values_generator/reposiories/sentence_repository_impl.dart';

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
      SentenceDTO("Exceed clients' and colleagues' expectations", false),
      SentenceDTO(
          "Take ownership and question the status quo in a constructive manner",
          false),
      SentenceDTO(
          "Be brave, curious and experiment. Learn from all successes and failures",
          false),
      SentenceDTO("Act in a way that makes all of us proud", false),
      SentenceDTO(
          "Build an inclusive, transparent and socially responsible culture",
          false),
      SentenceDTO(
          "Be ambitious, grow yourself and the people around you", false),
      SentenceDTO("Recognize excellence and engagement", false),
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
      "Exceed clients' and colleagues' expectations",
      true,
    );
    final updatedExistingSentences = [
      {
        "value": "Exceed clients' and colleagues' expectations",
        "isFavourite": true
      },
      {
        "value":
            "Take ownership and question the status quo in a constructive manner",
        "isFavourite": false
      },
      {
        "value":
            "Be brave, curious and experiment. Learn from all successes and failures",
        "isFavourite": false
      },
      {
        "value": "Act in a way that makes all of us proud",
        "isFavourite": false
      },
      {
        "value":
            "Build an inclusive, transparent and socially responsible culture",
        "isFavourite": false
      },
      {
        "value": "Be ambitious, grow yourself and the people around you",
        "isFavourite": false
      },
      {"value": "Recognize excellence and engagement", "isFavourite": false}
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
      "Make requirement task as best as you can",
      false,
    );
    final existingSentencesWithNewOne = [
      {
        "value": "Exceed clients' and colleagues' expectations",
        "isFavourite": false
      },
      {
        "value":
            "Take ownership and question the status quo in a constructive manner",
        "isFavourite": false
      },
      {
        "value":
            "Be brave, curious and experiment. Learn from all successes and failures",
        "isFavourite": false
      },
      {
        "value": "Act in a way that makes all of us proud",
        "isFavourite": false
      },
      {
        "value":
            "Build an inclusive, transparent and socially responsible culture",
        "isFavourite": false
      },
      {
        "value": "Be ambitious, grow yourself and the people around you",
        "isFavourite": false
      },
      {
        "value": "Recognize excellence and engagement",
        "isFavourite": false,
      },
      {
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
