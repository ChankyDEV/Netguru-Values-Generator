import 'package:flutter/material.dart';
import 'package:netguru_values_generator/screens/consts/colors.dart';
import 'package:netguru_values_generator/screens/sentences/sentences_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netguru sentences generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor:  LightColor.accent,
        ),
        scaffoldBackgroundColor: LightColor.background,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: LightColor.text,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: DarkColor.background,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      ),
      home: SentencesScreen(),
    );
  }
}
