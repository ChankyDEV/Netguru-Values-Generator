import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:netguru_values_generator/reposiories/sentence/sentence_repository.dart';
import 'package:netguru_values_generator/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SENTENCES = 'sentences';

class SentenceRepositoryImpl implements SentenceRepository {
  final SharedPreferences _preferences;

  SentenceRepositoryImpl(this._preferences);

  @override
  Future<List<SentenceDTO>> getAllSentences() {
    final sentences = _getAllSentences();
    if (sentences.isNotEmpty) {
      return Future.value(sentences);
    } else {
      throw SentenceException();
    }
  }

  @override
  Future<List<SentenceDTO>> getFavouriteSentences() {
    final sentences = _getAllSentences();
    if (sentences.isNotEmpty) {
      final favourites =
          sentences.where((sentence) => sentence.isFavourite).toList();
      if (favourites.isNotEmpty) {
        return Future.value(favourites);
      } else {
        throw SentenceException(
          message: ErrorMessages.sentences.noFavouriteSentences,
        );
      }
    }
    throw SentenceException();
  }

  List<SentenceDTO> _getAllSentences() {
    final sentencesString = _preferences.getString(SENTENCES);
    if (sentencesString != null) {
      final sentences = _getFavouritesFromString<SentenceDTO>(
        sentencesString,
        onConversion: (jsonMap) => SentenceDTO.fromJson(jsonMap),
      );
      return sentences;
    }
    return <SentenceDTO>[];
  }

  Future<SentenceDTO> _updateAlreadyExistingSentenceAtIndex(
    SentenceDTO sentence,
    List<SentenceDTO> sentences,
    int index,
  ) async {
    sentences[index] = sentence;
    final isSentenceSaved = await _preferences.setString(
      SENTENCES,
      json.encode(sentences),
    );
    if (isSentenceSaved) {
      return Future.value(sentence);
    } else {
      throw SentenceException();
    }
  }

  Future<SentenceDTO> _addNewSentence(SentenceDTO sentence,
      [List<SentenceDTO>? sentences]) async {
    sentences = sentences ?? [];
    sentences.add(sentence);
    final isSentenceSaved = await _preferences.setString(
      SENTENCES,
      json.encode(sentences),
    );
    if (isSentenceSaved) {
      return Future.value(sentence);
    } else {
      throw SentenceException();
    }
  }

  @override
  Future<SentenceDTO> saveSentence(SentenceDTO sentence) async {
    final isValid = validateSentence(sentence);
    if (isValid) {
      final sentencesString = _preferences.getString(SENTENCES);
      if (sentencesString != null) {
        final sentences = _getFavouritesFromString<SentenceDTO>(
          sentencesString,
          onConversion: (jsonMap) => SentenceDTO.fromJson(jsonMap),
        );
        final index = sentences.indexWhere(
          (element) => element.value == sentence.value,
        );
        if (index != -1) {
          return await _updateAlreadyExistingSentenceAtIndex(
            sentence,
            sentences,
            index,
          );
        } else {
          return await _addNewSentence(sentence, sentences);
        }
      }
      return await _addNewSentence(sentence);
    } else {
      throw SentenceException(
        message: ErrorMessages.sentences.sentenceValueIsNotValid,
      );
    }
  }

  List<T> _getFavouritesFromString<T>(
    String dataString, {
    required T Function(Map<String, dynamic>) onConversion,
  }) {
    final sentencesList = json.decode(dataString) as List<dynamic>;
    final sentences = <T>[];
    sentencesList.forEach((sentenceMap) {
      sentences.add(onConversion(sentenceMap));
    });
    return sentences;
  }

  @override
  Future<void> replaceAll(List<SentenceDTO> sentences) async {
    final areValid = areSentencesValuesValid(sentences);
    if (areValid) {
      final areSentencesSaved = await _preferences.setString(
        SENTENCES,
        json.encode(sentences),
      );
      if (!areSentencesSaved) {
        throw SentenceException();
      }
    } else {
      throw SentenceException(
        message: ErrorMessages.sentences.sentenceValueIsNotValid,
      );
    }
  }

  @visibleForTesting
  bool areSentencesValuesValid(List<SentenceDTO> sentences) => sentences.every(
        (sentence) => validateSentence(sentence),
      );

  @visibleForTesting
  bool validateSentence(SentenceDTO sentence) {
    return sentence.value != 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu' &&
        sentence.value != 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBCaWdJbnRlZ2Vy' &&
        sentence.value != 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBEb3VibGUu' &&
        sentence.value.isNotEmpty;
  }
}
