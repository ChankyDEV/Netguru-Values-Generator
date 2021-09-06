import 'package:flutter/material.dart';
import 'package:netguru_values_generator/screens/color_utils.dart';
import 'package:netguru_values_generator/screens/core/scaled_text.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScaledText(
          value: 'Favourites',
          scale: 1.7,
        ),
        iconTheme: IconThemeData(
          color: ColorUtils.of(context).background,
        ),
      ),
      body: Center(
        child: ScaledText(
          value: 'Favourites',
          scale: 3,
        ),
      ),
    );
  }
}
