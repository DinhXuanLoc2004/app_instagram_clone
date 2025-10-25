import 'package:flutter/material.dart';

class BlueTickCustomPaint extends CustomPainter {
  BlueTickCustomPaint({Color color = _COLOR_DEFAULT}) : _color = color;

  static const Color _COLOR_DEFAULT = Color(0xFF0098FD);

  final Color _color;

  @override
  void paint(Canvas canvas, Size size) {
    final double sx = size.width / 9.0;
    final double sy = size.height / 9.0;

    canvas.save();
    canvas.scale(sx, sy);

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = _color;

    final path = Path()..fillType = PathFillType.evenOdd;

    path.moveTo(5.53182, 0.829939);
    path.lineTo(4.4542, 0);
    path.lineTo(3.37657, 0.829939);
    path.lineTo(2.02131, 0.714359);
    path.lineTo(1.56345, 1.99516);
    path.lineTo(0.360852, 2.63063);
    path.lineTo(0.668129, 3.95565);
    path.lineTo(0, 5.14042);
    path.lineTo(0.974854, 6.08896);
    path.lineTo(1.05332, 7.44687);
    path.lineTo(2.38625, 7.71779);
    path.lineTo(3.1864, 8.81772);
    path.lineTo(4.4542, 8.325);
    path.lineTo(5.72199, 8.81772);
    path.lineTo(6.52215, 7.71779);
    path.lineTo(7.85507, 7.44687);
    path.lineTo(7.93354, 6.08896);
    path.lineTo(8.90839, 5.14042);
    path.lineTo(8.24026, 3.95565);
    path.lineTo(8.54754, 2.63063);
    path.lineTo(7.34494, 1.99516);
    path.lineTo(6.88708, 0.714359);
    path.lineTo(5.53182, 0.829939);
    path.close();

    path.moveTo(3.30775, 4.14645);
    path.cubicTo(3.11249, 3.95118, 2.79591, 3.95118, 2.60064, 4.14645);
    path.cubicTo(2.40538, 4.34171, 2.40538, 4.65829, 2.60064, 4.85355);
    path.lineTo(3.60064, 5.85355);
    path.cubicTo(3.79591, 6.04882, 4.11249, 6.04882, 4.30775, 5.85355);
    path.lineTo(6.30775, 3.85355);
    path.cubicTo(6.50301, 3.65829, 6.50301, 3.34171, 6.30775, 3.14645);
    path.cubicTo(6.11249, 2.95118, 5.79591, 2.95118, 5.60064, 3.14645);
    path.lineTo(3.9542, 4.79289);
    path.lineTo(3.30775, 4.14645);
    path.close();

    canvas.drawPath(path, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
