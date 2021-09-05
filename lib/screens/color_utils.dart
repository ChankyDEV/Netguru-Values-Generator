import 'package:flutter/material.dart';

class ColorUtils {
  BuildContext context;

  ColorUtils(this.context);

  static ColorUtils of(BuildContext context) {
    return ColorUtils(context);
  }

  Color get background => Theme.of(context).scaffoldBackgroundColor;

  Color get text => Theme.of(context).primaryColor;

  Color get accent => Theme.of(context).accentColor;

  Color get red => Color(0xFFDA0037);
}
