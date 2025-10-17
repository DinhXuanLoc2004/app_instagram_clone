import 'dart:math';

import 'package:flutter/material.dart';

class MessageCircleCustomPaint extends CustomPainter {
  MessageCircleCustomPaint({required ColorScheme colorScheme})
    : _colorScheme = colorScheme;

  final ColorScheme _colorScheme;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = _colorScheme.onSurface
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final p1 = Offset(size.width * 0.2, size.height);
    final p2 = Offset(size.width * 0.25, size.height * 0.85);
    final p3 = Offset(size.width * 0.35, size.height * 0.9);
    final center = Offset(size.width * 0.4934, size.height * 0.4882);
    final radius = size.width * 0.436;

    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p1, p3, paint);

    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    final startAngle = atan2(p2.dy - center.dy, p2.dx - center.dx);
    final endAngle = atan2(p3.dy - center.dy, p3.dx - center.dx);
    double sweepAngle = endAngle - startAngle;

    if (sweepAngle.abs() < pi) {
      sweepAngle = sweepAngle > 0 ? sweepAngle - 2 * pi : sweepAngle + 2 * pi;
    }

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    final p4 = Offset(size.width * 0.2, size.height * 0.65);
    final p5 = Offset(size.width * 0.399, size.height * 0.34);
    final p6 = Offset(size.width * 0.59, size.height * 0.44);
    final p7 = Offset(size.width * 0.8, size.height * 0.325);
    final p8 = Offset(size.width * 0.6, size.height * 0.63);
    final p9 = Offset(size.width * 0.415, size.height * 0.52);

    final Path path = Path()
      ..moveTo(p4.dx, p4.dy)
      ..lineTo(p5.dx, p5.dy)
      ..lineTo(p6.dx, p6.dy)
      ..lineTo(p7.dx, p7.dy)
      ..lineTo(p8.dx, p8.dy)
      ..lineTo(p9.dx, p9.dy)
      ..close();

    canvas.drawPath(path, paint..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
