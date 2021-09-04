import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:netguru_values_generator/keys.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:netguru_values_generator/reposiories/sentence/sentence_repository.dart';
import 'package:netguru_values_generator/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SentenceRepositoryImpl implements SentenceRepository {
  final SharedPreferences _preferences;
  List<SentenceDTO> _sentences = <SentenceDTO>[];

  SentenceRepositoryImpl(this._preferences);

  @override
  Future<List<SentenceDTO>> getAllSentences() {
    final sentences = _getAllSentences();
    if (sentences.isNotEmpty) {
      return Future.value(sentences);
    } else {
      throw SentenceException(
        message: SentenceErrorMessages.noSentences,
      );
    }
  }

  @override
  Future<List<SentenceDTO>> getFavouriteSentences() {
    _sentences = _getAllSentences();
    if (_sentences.isNotEmpty) {
      final favourites =
          _sentences.where((sentence) => sentence.isFavourite).toList();
      if (favourites.isNotEmpty) {
        return Future.value(favourites);
      } else {
        throw SentenceException(
          message: SentenceErrorMessages.noFavouriteSentences,
        );
      }
    }
    throw SentenceException(
      message: SentenceErrorMessages.noSentences,
    );
  }

  List<SentenceDTO> _getAllSentences() {
    final sentencesString =
        _preferences.getString(SharedPreferencesKeys.sentences);
    if (sentencesString != null) {
      _sentences = _getSentencesFromString<SentenceDTO>(
        sentencesString,
        onConversion: (jsonMap) => SentenceDTO.fromJson(jsonMap),
      );
      return _sentences;
    }
    return <SentenceDTO>[];
  }

  List<T> _getSentencesFromString<T>(
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
  Future<SentenceDTO> saveSentence(SentenceDTO sentence) async {
    final isValid = validateSentence(sentence);
    if (isValid) {
      final sentences = _getAllSentences();
      if (sentences.isNotEmpty) {
        final existingSentence = findByUid(sentence.uid);
        if (existingSentence != null) {
          return await _updateSentence(
            sentence,
            uid: existingSentence.uid,
          );
        } else {
          return await _addNewSentence(sentence);
        }
      } else {
        throw SentenceException(message: SentenceErrorMessages.noSentences);
      }
    } else {
      throw SentenceException(
        message: SentenceErrorMessages.sentenceValueIsNotValid,
      );
    }
  }

  Future<SentenceDTO> _updateSentence(
    SentenceDTO sentence, {
    required String uid,
  }) async {
    final index = _sentences.indexWhere((s) => s.uid == uid);
    _sentences[index] = sentence;
    final isSentenceSaved = await _preferences.setString(
      SharedPreferencesKeys.sentences,
      json.encode(_sentences),
    );
    if (isSentenceSaved) {
      return Future.value(sentence);
    } else {
      throw SentenceException(
        message: SentenceErrorMessages.cantSaveSentence,
      );
    }
  }

  Future<SentenceDTO> _addNewSentence(SentenceDTO sentence) async {
    _sentences.add(sentence);
    final isSentenceSaved = await _preferences.setString(
      SharedPreferencesKeys.sentences,
      json.encode(_sentences),
    );
    if (isSentenceSaved) {
      return Future.value(sentence);
    } else {
      throw SentenceException(
        message: SentenceErrorMessages.cantSaveSentence,
      );
    }
  }

  @visibleForTesting
  SentenceDTO? findByUid(String uid) {
    try {
      final sentence =
          _sentences.where((sentence) => sentence.uid == uid).first;
      return sentence;
    } on StateError {
      return null;
    }
  }

  @override
  Future<void> replaceAll(List<SentenceDTO> sentences) async {
    final areValid = areSentencesValuesValid(sentences);
    if (areValid) {
      final areSentencesSaved = await _preferences.setString(
        SharedPreferencesKeys.sentences,
        json.encode(sentences),
      );
      if (!areSentencesSaved) {
        throw SentenceException(
          message: SentenceErrorMessages.cantReplaceAllSentences,
        );
      }
    } else {
      throw SentenceException(
        message: SentenceErrorMessages.sentenceValueIsNotValid,
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
