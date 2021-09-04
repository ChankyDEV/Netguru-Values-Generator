import 'package:flutter/material.dart';
import 'package:netguru_values_generator/screens/consts/colors.dart';

class Themes {
  static ThemeData get dark => ThemeData(
        accentColor: DarkColor.accent,
        primaryColor: DarkColor.text,
        fontFamily: "Josefin-Sans",
        scaffoldBackgroundColor: DarkColor.background,
        iconTheme: IconThemeData(color: DarkColor.accent),
        appBarTheme: AppBarTheme(
          backgroundColor: DarkColor.accent,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: DarkColor.text,
            fontWeight: FontWeight.normal,
          ),
          bodyText1: TextStyle(
            color: DarkColor.text,
            fontWeight: FontWeight.normal,
          ),
        ),
      );

  static ThemeData get light => ThemeData(
        fontFamily: "Josefin-Sans",
        accentColor: LightColor.accent,
        primaryColor: LightColor.text,
        appBarTheme: AppBarTheme(
          backgroundColor: LightColor.accent,
        ),
        iconTheme: IconThemeData(color: DarkColor.text),
        scaffoldBackgroundColor: LightColor.background,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: LightColor.text,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
}
