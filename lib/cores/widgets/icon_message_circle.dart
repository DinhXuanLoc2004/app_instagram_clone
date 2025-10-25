import 'package:app_instagram_clone/cores/widgets/message_circle_custom_paint.dart';
import 'package:flutter/material.dart';

class IconMessageCircle extends StatelessWidget {
  const IconMessageCircle({super.key, double size = _SIZE_DEFAULT})
    : _size = size;

  static const double _SIZE_DEFAULT = 24;

  final double _size;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return CustomPaint(
      size: Size(_size, _size),
      painter: MessageCircleCustomPaint(colorScheme: themeData.colorScheme),
    );
  }
}
