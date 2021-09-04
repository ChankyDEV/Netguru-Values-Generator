
import 'package:flutter/cupertino.dart';

class Utils {

  static double getSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? width
        : height;
  }

}