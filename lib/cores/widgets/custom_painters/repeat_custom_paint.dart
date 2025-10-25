import 'package:flutter/material.dart';

class RepeatCustomPaint extends CustomPainter {
  RepeatCustomPaint({Color color = Colors.black, double strokeWidth = 1.7})
    : _color = color,
      _strokeWidth = strokeWidth;

  final Color _color;
  final double _strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    final topArrow = Path()
      ..moveTo(w * 17 / 24, h * 1 / 24)
      ..lineTo(w * 21 / 24, h * 5 / 24)
      ..lineTo(w * 17 / 24, h * 9 / 24);
    canvas.drawPath(topArrow, paint);

    final topPath = Path()
      ..moveTo(w * 3 / 24, h * 11 / 24)
      ..lineTo(w * 3 / 24, h * 9 / 24)
      ..arcToPoint(
        Offset(w * 7 / 24, h * 5 / 24),
        radius: Radius.circular(w * 4 / 24),
        clockwise: true,
      )
      ..lineTo(w * 21 / 24, h * 5 / 24);
    canvas.drawPath(topPath, paint);

    final bottomArrow = Path()
      ..moveTo(w * 7 / 24, h * 23 / 24)
      ..lineTo(w * 3 / 24, h * 19 / 24)
      ..lineTo(w * 7 / 24, h * 15 / 24);
    canvas.drawPath(bottomArrow, paint);

    final bottomPath = Path()
      ..moveTo(w * 21 / 24, h * 13 / 24)
      ..lineTo(w * 21 / 24, h * 15 / 24)
      ..arcToPoint(
        Offset(w * 17 / 24, h * 19 / 24),
        radius: Radius.circular(w * 4 / 24),
        clockwise: true,
      )
      ..lineTo(w * 3 / 24, h * 19 / 24);
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
