import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/models/sentence_dto.dart';
import 'package:netguru_values_generator/services/user_presence/user_presence_service.dart';
import 'package:netguru_values_generator/services/user_presence/user_presence_service_impl.dart';
import 'package:netguru_values_generator/utils/consts.dart';

import '../../utils/mocks/sentence_repository_mock.dart';
import '../../utils/mocks/sentence_to_dto_converter_mock.dart';
import '../../utils/mocks/user_presence_repository_mock.dart';

void main() {
  late UserPresenceService service;
  late MockSentenceRepository sentenceRepository;
  late MockUserPresenceRepository userPresenceRepository;
  late MockSentenceToDtoConverter converter;
  final tBasicSentences = <Sentence>[
    Sentence(
      "Exceed clients' and colleagues' expectations",
      false,
    ),
    Sentence(
        "Take ownership and question the status quo in a constructive manner",
        false),
    Sentence(
        "Be brave, curious and experiment. Learn from all successes and failures",
        false),
    Sentence(
      "Act in a way that makes all of us proud",
      false,
    ),
    Sentence("Build an inclusive, transparent and socially responsible culture",
        false),
    Sentence(
      "Be ambitious, grow yourself and the people around you",
      false,
    ),
    Sentence(
      "Recognize excellence and engagement",
      false,
    ),
  ];
  setUpAll(() {
    sentenceRepository = MockSentenceRepository();
    userPresenceRepository = MockUserPresenceRepository();
    converter = MockSentenceToDtoConverter();
    service = UserPresenceServiceImpl(
      userPresenceRepository,
      sentenceRepository,
      converter,
      tBasicSentences,
    );
  });

  final tBasicSentencesDtos = [
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

  group('configureApp', () {
    test('should return unit if successfully configured app for existing user',
        () async {
      when(userPresenceRepository.isEnteringFirstTime()).thenAnswer(
        (_) async => false,
      );

      final result = await service.configureApp();
      verify(userPresenceRepository.isEnteringFirstTime());
      verifyNever(converter.convertAllToDtos(tBasicSentences));
      verifyNever(sentenceRepository.replaceAll(tBasicSentencesDtos));
      verifyNever(userPresenceRepository.saveUserPresence());
      expect(result, right(unit));
    });

    test('should return unit if successfully configured app for new user',
        () async {
      when(userPresenceRepository.isEnteringFirstTime()).thenAnswer(
        (_) async => true,
      );
      when(converter.convertAllToDtos(any)).thenReturn(tBasicSentencesDtos);
      when(sentenceRepository.replaceAll(any)).thenAnswer((_) async => null);
      when(userPresenceRepository.saveUserPresence())
          .thenAnswer((_) async => null);
      final result = await service.configureApp();
      verify(userPresenceRepository.isEnteringFirstTime());
      verify(converter.convertAllToDtos(tBasicSentences));
      verify(sentenceRepository.replaceAll(tBasicSentencesDtos));
      verify(userPresenceRepository.saveUserPresence());
      expect(result, right(unit));
    });

    test(
        'should return failure if cant get information about user entering first time',
        () async {
      when(userPresenceRepository.isEnteringFirstTime()).thenThrow(
        UserPresenceException(
          message: UserPresenceErrorMessages.cantGetInfoAboutEntering,
        ),
      );
      final result = await service.configureApp();
      verify(userPresenceRepository.isEnteringFirstTime());
      verifyNever(converter.convertAllToDtos(tBasicSentences));
      verifyNever(sentenceRepository.replaceAll(tBasicSentencesDtos));
      verifyNever(userPresenceRepository.saveUserPresence());
      expect(
        result,
        left(
          const Failure(
            UserPresenceErrorMessages.cantGetInfoAboutEntering,
          ),
        ),
      );
    });

    test('should return failure if cant replace all when enter first time',
        () async {
      when(userPresenceRepository.isEnteringFirstTime())
          .thenAnswer((_) async => true);
      when(sentenceRepository.replaceAll(any)).thenThrow(
        SentenceException(
          message: SentenceErrorMessages.cantReplaceAllSentences,
        ),
      );
      final result = await service.configureApp();
      verify(userPresenceRepository.isEnteringFirstTime());
      verify(converter.convertAllToDtos(tBasicSentences));
      verify(sentenceRepository.replaceAll(tBasicSentencesDtos));
      verifyNever(userPresenceRepository.saveUserPresence());
      expect(
        result,
        left(
          const Failure(
            SentenceErrorMessages.cantReplaceAllSentences,
          ),
        ),
      );
    });

    test('should return failure if cant save user presence', () async {
      when(userPresenceRepository.isEnteringFirstTime())
          .thenAnswer((_) async => true);
      when(converter.convertAllToDtos(any)).thenReturn(tBasicSentencesDtos);
      when(sentenceRepository.replaceAll(any)).thenAnswer((_) async => null);
      when(userPresenceRepository.saveUserPresence())
          .thenThrow(UserPresenceException(
        message: UserPresenceErrorMessages.cantSaveUserPresence,
      ));
      final result = await service.configureApp();
      verify(userPresenceRepository.isEnteringFirstTime());
      verify(converter.convertAllToDtos(tBasicSentences));
      verify(sentenceRepository.replaceAll(tBasicSentencesDtos));
      verify(userPresenceRepository.saveUserPresence());
      expect(
        result,
        left(
          const Failure(UserPresenceErrorMessages.cantSaveUserPresence),
        ),
      );
    });
  });
}
