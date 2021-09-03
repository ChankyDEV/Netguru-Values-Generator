import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';

import '../utils/fixtures/fixture_reader.dart';

void main() {
  const tFavouriteSentence = SentenceDTO(
    "Exceed clients' and colleagues' expectations",
    true,
  );
  const tNotFavouriteSentence = SentenceDTO(
    "Take ownership and question the status quo in a constructive manner",
    false,
  );

  group('toJson', () {
    test('should convert favourite sentenceDTO to json format', () {
      final actual = tFavouriteSentence.toJson();
      final expected = {
        'value': "Exceed clients' and colleagues' expectations",
        'isFavourite': true
      };
      expect(actual, expected);
    });

    test('should convert not favourite sentenceDTO to json format', () {
      final actual = tNotFavouriteSentence.toJson();
      final expected = {
        'value':
            "Take ownership and question the status quo in a constructive manner",
        'isFavourite': false
      };
      expect(actual, expected);
    });
  });
  group('fromJson', () {
    test(
        'should convert json with isFavourite equals true to sentenceDTO with isFavourite equals true',
        () {
      final jsonMap = json.decode(fixture('favourite_sentence.json'));
      final sentence = SentenceDTO.fromJson(jsonMap);

      expect(sentence, tFavouriteSentence);
    });

    test(
        'should convert json with isFavourite equals false to sentenceDTO with isFavourite equals false',
            () {
          final jsonMap = json.decode(fixture('not_favourite_sentence.json'));
          final sentence = SentenceDTO.fromJson(jsonMap);

          expect(sentence, tNotFavouriteSentence);
        });

  });
}
