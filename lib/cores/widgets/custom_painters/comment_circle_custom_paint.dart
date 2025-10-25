import 'package:flutter/material.dart';

class CommentCircleCustomPaint extends CustomPainter {
  CommentCircleCustomPaint({Color color = Colors.black}) : _color = color;

static const double _ORIGINAL_SIZE = 18;

  final Color _color;

  @override
  void paint(Canvas canvas, Size size) {
    final double sx = size.width / _ORIGINAL_SIZE;
    final double sy = size.height / _ORIGINAL_SIZE;

    canvas.save();
    canvas.scale(sx, sy);

    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = _color;

    final Path path = Path()..fillType = PathFillType.evenOdd;

    path.moveTo(9, 2);
    path.cubicTo(5.13401, 2, 2, 5.13401, 2, 9);
    path.cubicTo(2, 12.866, 5.13401, 16, 9, 16);
    path.cubicTo(10.3137, 16, 11.54, 15.6391, 12.5886, 15.0116);
    path.cubicTo(12.8209, 14.8726, 13.0995, 14.8337, 13.361, 14.9037);
    path.lineTo(15.4741, 15.4699);
    path.lineTo(14.9074, 13.3548);
    path.cubicTo(14.8374, 13.0937, 14.8762, 12.8153, 15.0148, 12.5833);
    path.cubicTo(15.6403, 11.5358, 16, 10.3114, 16, 9);
    path.cubicTo(16, 5.13401, 12.866, 2, 9, 2);
    path.close();

    path.moveTo(0, 9);
    path.cubicTo(0, 4.02944, 4.02944, 0, 9, 0);
    path.cubicTo(13.9706, 0, 18, 4.02944, 18, 9);
    path.cubicTo(18, 10.528, 17.6184, 11.9694, 16.9449, 13.2316);
    path.lineTo(17.8543, 16.6253);
    path.cubicTo(17.9468, 16.9704, 17.8481, 17.3386, 17.5955, 17.5913);
    path.cubicTo(17.3428, 17.8439, 16.9746, 17.9426, 16.6295, 17.8501);
    path.lineTo(13.2382, 16.9414);
    path.cubicTo(11.9745, 17.6171, 10.5307, 18, 9, 18);
    path.cubicTo(4.02944, 18, 0, 13.9706, 0, 9);
    path.close();

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
