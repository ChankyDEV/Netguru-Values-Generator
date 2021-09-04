import 'package:flutter/material.dart';

class ScaledText extends StatelessWidget {
  final String value;
  final double scale;
  final TextStyle? style;
  final TextAlign? align;

  const ScaledText({
    Key? key,
    required this.value,
    required this.scale,
    this.style,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customStyle = style ?? Theme.of(context).textTheme.bodyText1;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final screenScale = width > height ? height/width : width/height;
    return Text(
      value,
      style: customStyle!.copyWith(fontSize: 20 * scale * screenScale),
      textAlign: align,
    );
  }
}
