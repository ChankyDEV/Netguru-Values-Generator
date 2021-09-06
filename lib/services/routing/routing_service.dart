import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:netguru_values_generator/blocs/initialization/initialization_bloc.dart';
import 'package:netguru_values_generator/blocs/sentence/sentence_bloc.dart';
import 'package:netguru_values_generator/screens/sentences/all_sentences_screen.dart';
import 'package:netguru_values_generator/screens/sentences/favourite_screen.dart';
import 'package:netguru_values_generator/screens/sentences/sentences_screen.dart';
import 'package:netguru_values_generator/screens/wrapper.dart';

class Screens {
  static const initial = '/';
  static const sentences = '/sentences';
  static const error = '/error';
  static const favourites = '/favourites';
  static const allSentences = '/allSentences';
}

class RoutingService {
  final GetIt getIt = GetIt.I;

  Route? routes(RouteSettings settings) {
    switch (settings.name) {
      case Screens.initial:
        return initial();
      case Screens.sentences:
        return sentences();
      case Screens.error:
        return error();
      case Screens.favourites:
        return favourites();
      case Screens.allSentences:
        return allSentences();
      default:
        return sentences();
    }
  }

  MaterialPageRoute<Wrapper> initial() {
    final initializationBloc = getIt.get<InitializationBloc>();
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => initializationBloc..configureApp(),
        child: Wrapper(),
      ),
    );
  }

  MaterialPageRoute<SentencesScreen> sentences() {
    final sentenceBloc = getIt.get<SentenceBloc>();
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => sentenceBloc..getInitialSentences(),
        child: SentencesScreen(),
      ),
    );
  }

  MaterialPageRoute error() {
    return MaterialPageRoute(
      builder: (context) => Container(),
    );
  }

  MaterialPageRoute favourites() {
    return MaterialPageRoute(
      builder: (context) => FavouritesScreen(),
    );
  }

  MaterialPageRoute allSentences() {
    return MaterialPageRoute(
      builder: (context) => AllSentencesScreen(),
    );
  }
}
