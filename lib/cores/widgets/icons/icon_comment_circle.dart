import 'package:app_instagram_clone/cores/widgets/custom_painters/comment_circle_custom_paint.dart';
import 'package:flutter/material.dart';

class IconCommentCircle extends StatelessWidget {
  const IconCommentCircle({super.key, double size = _SIZE_DEFAULT})
    : _size = size;

  static const double _SIZE_DEFAULT = 18;

  final double _size;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return CustomPaint(
      size: Size.square(_size),
      painter: CommentCircleCustomPaint(color: colorScheme.onSurface),
    );
  }
}
