import 'package:flutter/material.dart';
import 'package:netguru_values_generator/screens/sentences/sentences_screen.dart';

class Screens {
  static const initial = '/';
}

class RoutingService {
  Route? routes(RouteSettings settings) {
    switch (settings.name) {
      case Screens.initial:
        return sentences();
      default:
        return sentences();
    }
  }

  MaterialPageRoute<SentencesScreen> sentences() {
    return MaterialPageRoute(
      builder: (context) => SentencesScreen(),
    );
  }
}
