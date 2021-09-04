import 'package:get_it/get_it.dart';
import 'package:netguru_values_generator/converters/sentence/sentence_to_dto_converter.dart';
import 'package:netguru_values_generator/models/sentence.dart';
import 'package:netguru_values_generator/reposiories/sentence/sentence_repository.dart';
import 'package:netguru_values_generator/reposiories/sentence/sentence_repository_impl.dart';
import 'package:netguru_values_generator/reposiories/user_presence/user_presence_repository.dart';
import 'package:netguru_values_generator/reposiories/user_presence/user_presence_repository_impl.dart';
import 'package:netguru_values_generator/services/routing/routing_service.dart';
import 'package:netguru_values_generator/services/sentence/sentence_service.dart';
import 'package:netguru_values_generator/services/sentence/sentence_service_impl.dart';
import 'package:netguru_values_generator/services/user_presence/user_presence_service.dart';
import 'package:netguru_values_generator/services/user_presence/user_presence_service_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class Config {
  final GetIt getIt = GetIt.I;

  Future<void> configureDependencies() async {
    await _registerDataSources();
    await _registerServices();
  }

  Future<void> _registerDataSources() async {
    final preferences = await SharedPreferences.getInstance();
    getIt
      ..registerSingleton<SentenceRepository>(
        SentenceRepositoryImpl(preferences),
      )
      ..registerSingleton<UserPresenceRepository>(
        UserPresenceRepositoryImpl(preferences),
      );
  }

  Future<void> _registerServices() async {
    final sentenceRepository = getIt.get<SentenceRepository>();
    final userPresenceRepository = getIt.get<UserPresenceRepository>();
    final generator = Uuid();
    final converter = SentenceToDtoConverter(generator);
    getIt
      ..registerSingleton<RoutingService>(
        RoutingService(),
      )
      ..registerSingleton<UserPresenceService>(
        UserPresenceServiceImpl(
          userPresenceRepository,
          sentenceRepository,
          converter,
          _startUpSentences,
        ),
      )
      ..registerSingleton<SentenceService>(
        SentenceServiceImpl(
          sentenceRepository,
          converter,
        ),
      );
  }
}

final _startUpSentences = <Sentence>[
  Sentence(
    "Exceed clients' and colleagues' expectations",
    false,
  ),
  Sentence(
    "Take ownership and question the status quo in a constructive manner",
    false,
  ),
  Sentence(
    "Be brave, curious and experiment. Learn from all successes and failures",
    false,
  ),
  Sentence(
    "Act in a way that makes all of us proud",
    false,
  ),
  Sentence(
    "Build an inclusive, transparent and socially responsible culture",
    false,
  ),
  Sentence(
    "Be ambitious, grow yourself and the people around you",
    false,
  ),
  Sentence(
    "Recognize excellence and engagement",
    false,
  ),
];
