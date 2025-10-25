import 'package:flutter/material.dart';

class BookmartCustomPaint extends CustomPainter {
  const BookmartCustomPaint({required ColorScheme colorScheme})
    : _colorScheme = colorScheme;

  final ColorScheme _colorScheme;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _colorScheme.onSurface
      ..style = PaintingStyle.fill;

    final path = Path();

    // Path tương đương với d="M8 12.8889L15.271 18.9481C15.5605 19.1893 16 18.9835 16 18.6066V0H0V18.6066C0 18.9835 0.439492 19.1893 0.728971 18.9481L8 12.8889Z"
    path.moveTo(size.width * 0.5, size.height * 0.6444);
    path.lineTo(size.width * 0.9544, size.height * 0.9474);
    path.cubicTo(
      size.width * 0.972,
      size.height * 0.9595,
      size.width,
      size.height * 0.9492,
      size.width,
      size.height * 0.9303,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.9303);
    path.cubicTo(
      0,
      size.height * 0.9492,
      size.width * 0.0275,
      size.height * 0.9595,
      size.width * 0.0456,
      size.height * 0.9474,
    );
    path.lineTo(size.width * 0.5, size.height * 0.6444);
    path.close();

    // Path thứ hai: d="M2 15.2855L6.71963 11.3524C7.46132 10.7344 8.53868 10.7344 9.28037 11.3524L14 15.2855V2H2V15.2855Z"
    final inner = Path();
    inner.moveTo(size.width * 0.125, size.height * 0.7643);
    inner.lineTo(size.width * 0.4199, size.height * 0.5676);
    inner.cubicTo(
      size.width * 0.4663,
      size.height * 0.5367,
      size.width * 0.5337,
      size.height * 0.5367,
      size.width * 0.5801,
      size.height * 0.5676,
    );
    inner.lineTo(size.width * 0.875, size.height * 0.7643);
    inner.lineTo(size.width * 0.875, size.height * 0.1);
    inner.lineTo(size.width * 0.125, size.height * 0.1);
    inner.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(
      inner,
      Paint()
        ..color = _colorScheme.surface
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
