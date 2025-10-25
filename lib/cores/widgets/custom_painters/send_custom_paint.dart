import 'package:flutter/material.dart';

class SendCustomPaint extends CustomPainter {
  SendCustomPaint({Color color = Colors.black}) : _color = color;

  static const double _ORIGINAL_SIZE = 24;

  final Color _color;

  @override
  void paint(Canvas canvas, Size size) {
    final double sx = size.width / _ORIGINAL_SIZE;
    final double sy = size.height / _ORIGINAL_SIZE;

    canvas.save();
    canvas.scale(sx, sy);

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = _color;

    final path = Path()..fillType = PathFillType.evenOdd;

    path.moveTo(2.32435, 5.09454);
    path.cubicTo(1.64037, 4.33808, 2.10065, 3, 3.2445, 3);
    path.lineTo(21, 3);
    path.cubicTo(21.3548, 3, 21.6831, 3.18803, 21.8626, 3.49409);
    path.cubicTo(22.0421, 3.80016, 22.0459, 4.17843, 21.8728, 4.48811);
    path.lineTo(12.9951, 20.3621);
    path.cubicTo(12.4461, 21.3437, 11.0257, 21.1444, 10.7185, 20.1049);
    path.lineTo(8.20479, 11.5981);
    path.lineTo(2.32435, 5.09454);
    path.close();

    path.moveTo(10.2783, 11.5575);
    path.lineTo(12.1276, 17.8158);
    path.lineTo(18.304, 6.77187);
    path.lineTo(10.2783, 11.5575);
    path.close();

    path.moveTo(17.3704, 5);
    path.lineTo(4.93521, 5);
    path.lineTo(9.29121, 9.81757);
    path.lineTo(17.3704, 5);
    path.close();

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
