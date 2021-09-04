import 'package:flutter/material.dart';

class ScaledIcon extends StatelessWidget {
  final IconData icon;
  final double scale;
  final Color? color;

  const ScaledIcon({
    Key? key,
    required this.icon,
    required this.scale,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final screenScale = width > height ? height / width : width / height;
    return Icon(
      icon,
      size: 20 * scale * screenScale,
      color: color,
    );
  }
}
