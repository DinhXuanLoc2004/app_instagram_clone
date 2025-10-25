import 'package:app_instagram_clone/cores/widgets/custom_painters/repeat_custom_paint.dart';
import 'package:flutter/material.dart';

class IconRepeat extends StatelessWidget {
  const IconRepeat({super.key, double size = _SIZE_DEFAULT}) : _size = size;

  static const double _SIZE_DEFAULT = 18;

  final double _size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(_size),
      painter: RepeatCustomPaint(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
