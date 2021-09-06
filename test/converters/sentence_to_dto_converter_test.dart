import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/converters/sentence/sentence_converter.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';

import '../utils/mocks/uuid_generator_mock.dart';

void main() {
  final generator = MockUuidGenerator();
  final converter = SentenceConverter(
    generator,
  );

  group('convert', () {
    final tSentence = Sentence('', 'value', true);
    final tSentenceDto = SentenceDTO('123', 'value', true);
    test('should convert sentence to dto', () {
      when(generator.v4()).thenReturn('123');
      final dto = converter.convertToDto(tSentence);
      expect(dto, tSentenceDto);
    });
  });
}
