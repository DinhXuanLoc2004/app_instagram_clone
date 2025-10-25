import 'package:app_instagram_clone/cores/widgets/custom_painters/send_custom_paint.dart';
import 'package:flutter/material.dart';

class IconSend extends StatelessWidget {
  const IconSend({super.key, double size = _SIZE_DEFAULT}) : _size = size;

  static const double _SIZE_DEFAULT = 24;

  final double _size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(_size),
      painter: SendCustomPaint(color: Theme.of(context).colorScheme.onSurface),
    );
  }
}
