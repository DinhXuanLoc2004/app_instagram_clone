import 'package:flutter/material.dart';

extension PaintCopyWithExtension on Paint {
  Paint copyWith({
    Color? color,
    double? strokeWidth,
    StrokeCap? strokeCap,
    PaintingStyle? style,
  }) {
    return Paint()
      ..color = color ?? this.color
      ..strokeWidth = strokeWidth ?? this.strokeWidth
      ..strokeCap = strokeCap ?? this.strokeCap
      ..style = style ?? this.style;
  }
}
