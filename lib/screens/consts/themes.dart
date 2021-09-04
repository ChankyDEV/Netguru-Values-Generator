import 'package:flutter/material.dart';
import 'package:netguru_values_generator/screens/consts/colors.dart';

class Themes {
  static ThemeData get dark => ThemeData(
        primaryColor: Colors.red,
        fontFamily: "Josefin-Sans",
        scaffoldBackgroundColor: DarkColor.background,
        iconTheme: IconThemeData(color: DarkColor.text),
        appBarTheme: AppBarTheme(
          backgroundColor: DarkColor.accent,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: DarkColor.text,
            fontWeight: FontWeight.normal,
            fontSize: 28.0,
          ),
        ),
      );

  static ThemeData get light => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Josefin-Sans",
        appBarTheme: AppBarTheme(
          backgroundColor: LightColor.accent,
        ),
        iconTheme: IconThemeData(color: DarkColor.text),
        scaffoldBackgroundColor: LightColor.background,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: LightColor.text,
            fontWeight: FontWeight.normal,
            fontSize: 28.0,
          ),
        ),
      );
}
