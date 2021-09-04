import 'package:flutter/material.dart';
import 'package:netguru_values_generator/screens/consts/themes.dart';
import 'package:netguru_values_generator/screens/sentences/sentences_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netguru sentences generator',
      theme: Themes.light,
      darkTheme: Themes.dark,
      debugShowCheckedModeBanner: false,
      home: SentencesScreen(),
    );
  }
}
