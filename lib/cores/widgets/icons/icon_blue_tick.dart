import 'package:app_instagram_clone/cores/widgets/custom_painters/blue_tick_custom_paint.dart';
import 'package:flutter/material.dart';

class IconBlueTick extends StatelessWidget {
  const IconBlueTick({super.key, double size = _SIZE_DEFAULT}) : _size = size;

  static const double _SIZE_DEFAULT = 9;

  final double _size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(_size),
      painter: BlueTickCustomPaint(),
    );
  }
}
