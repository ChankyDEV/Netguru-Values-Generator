import 'package:dartz/dartz.dart';
import 'package:netguru_values_generator/models/failure.dart';
import 'package:netguru_values_generator/reposiories/user_presence/user_presence_repository.dart';
import 'package:netguru_values_generator/reposiories/sentence/sentence_repository.dart';
import 'package:netguru_values_generator/services/user_presence/presence_service.dart';

class UserPresenceServiceImpl implements UserPresenceService {
  final UserPresenceRepository _presenceRepository;
  final SentenceRepository _sentenceRepository;

  UserPresenceServiceImpl(
    this._presenceRepository,
    this._sentenceRepository,
  );

  @override
  Future<Either<Failure, Unit>> configureApp() {
    // TODO: implement configureApp
    throw UnimplementedError();
  }
}