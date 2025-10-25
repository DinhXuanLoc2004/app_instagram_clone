import 'package:app_instagram_clone/cores/widgets/custom_painters/bookmart_custom_paint.dart';
import 'package:flutter/material.dart';

class IconBookmart extends StatelessWidget {
  const IconBookmart({
    super.key,
    double width = _WIDTH_DEFAULT,
    double height = _HEIGHT_DEFAULT,
  }) : _width = width,
       _height = height;

  static const double _WIDTH_DEFAULT = 16;
  static const double _HEIGHT_DEFAULT = 19.1;

  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(_width, _height),
      painter: BookmartCustomPaint(colorScheme: Theme.of(context).colorScheme),
    );
  }
}
