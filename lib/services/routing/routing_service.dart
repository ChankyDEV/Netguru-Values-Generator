import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:netguru_values_generator/blocs/all_sentences/all_sentences_bloc.dart';
import 'package:netguru_values_generator/blocs/favourites/favourite_bloc.dart';
import 'package:netguru_values_generator/blocs/initialization/initialization_bloc.dart';
import 'package:netguru_values_generator/blocs/sentence/sentence_bloc.dart';
import 'package:netguru_values_generator/screens/color_utils.dart';
import 'package:netguru_values_generator/screens/core/error_screen.dart';
import 'package:netguru_values_generator/screens/core/scaled_container.dart';
import 'package:netguru_values_generator/screens/core/scaled_icon.dart';
import 'package:netguru_values_generator/screens/sentences/all_sentences_screen.dart';
import 'package:netguru_values_generator/screens/sentences/favourite_screen.dart';
import 'package:netguru_values_generator/screens/sentences/sentences_screen.dart';
import 'package:netguru_values_generator/screens/wrapper.dart';
import 'package:netguru_values_generator/services/sentence/sentence_service.dart';

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
      builder: (context) => ErrorScreen(
        information: 'Something goes wrong, please reinstall the app',
        child: ScaledContainer(
          scale: 0.4,
          color: ColorUtils.of(context).red,
          shape: BoxShape.circle,
          child: ScaledIcon(
            scale: 8,
            icon: Icons.cancel_outlined,
            color: ColorUtils.of(context).background,
          ),
        ),
        isRetryButtonClicked: false,
        onRetryButtonClick: () {},
        showButton: false,
      ),
    );
  }

  MaterialPageRoute favourites() {
    final sentenceService = getIt.get<SentenceService>();
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) =>
            FavouriteBloc(sentenceService)..getFavouriteSentences(),
        child: FavouritesScreen(),
      ),
    );
  }

  MaterialPageRoute allSentences() {
    final sentenceService = getIt.get<SentenceService>();
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) =>
            AllSentencesBloc(sentenceService)..getAllSentences(),
        child: AllSentencesScreen(),
      ),
    );
  }
}
