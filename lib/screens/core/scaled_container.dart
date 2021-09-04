import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:netguru_values_generator/screens/utils.dart';

class ScaledContainer extends StatelessWidget {
  final Widget? child;
  final double scale;
  final Color? color;
  final Alignment? alignment;
  final BoxShape? shape;
  final BorderRadius? borderRadius;

  const ScaledContainer({
    Key? key,
    required this.scale,
    this.color,
    this.alignment,
    this.shape,
    this.child,
    this.borderRadius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Utils.getSize(context);
    return Container(
      width: size * scale,
      height: size * scale,
      alignment: alignment,
      child: child,
      decoration: BoxDecoration(
        color: color,
        shape: shape ?? BoxShape.rectangle,
        borderRadius: borderRadius,
      ),
    );
  }
}
