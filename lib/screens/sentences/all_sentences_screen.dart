import 'package:flutter/material.dart';
import 'package:netguru_values_generator/screens/color_utils.dart';
import 'package:netguru_values_generator/screens/core/scaled_text.dart';

class AllSentencesScreen extends StatelessWidget {
  const AllSentencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScaledText(
          value: 'All sentences',
          scale: 1.7,
        ),
        iconTheme: IconThemeData(
          color: ColorUtils.of(context).background,
        ),
      ),
      body: Center(
        child: ScaledText(
          value: 'All sentences',
          scale: 3,
        ),
      ),
    );
  }
}
