import 'package:dartz/dartz.dart';
import 'package:netguru_values_generator/converters/sentence/sentence_converter.dart';
import 'package:netguru_values_generator/models/exceptions.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/reposiories/sentence/sentence_repository.dart';
import 'package:netguru_values_generator/reposiories/user_presence/user_presence_repository.dart';
import 'package:netguru_values_generator/services/user_presence/user_presence_service.dart';
import 'package:netguru_values_generator/utils/consts.dart';

class UserPresenceServiceImpl implements UserPresenceService {
  final UserPresenceRepository _userPresenceRepository;
  final SentenceRepository _sentenceRepository;
  final SentenceConverter _converter;
  final List<Sentence> _startUpSentences;

  UserPresenceServiceImpl(
    this._userPresenceRepository,
    this._sentenceRepository,
    this._converter,
    this._startUpSentences,
  );

  @override
  Future<Either<Failure, Unit>> configureApp() async {
    try {
      final isFirstTime = await _userPresenceRepository.isEnteringFirstTime();
      if (isFirstTime) {
        _sentenceRepository.replaceAll(
          _converter.convertAllToDtos(
            _startUpSentences,
          ),
        );
        await _userPresenceRepository.saveUserPresence();
        return right(unit);
      }
      return right(unit);
    } on UserPresenceException catch (e) {
      return left(
        Failure(e.message),
      );
    } on SentenceException {
      return left(
        const Failure(
          SentenceErrorMessages.cantReplaceAllSentences,
        ),
      );
    }
  }
}
