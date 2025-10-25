import 'package:flutter/material.dart';

abstract final class ColorConfig {
  static const Color PRIMARY_COLOR = Color(0xFF1877F2);

  static const LinearGradient COLOR_STORY = LinearGradient(
    begin: AlignmentGeometry.topRight,
    end: AlignmentGeometry.bottomLeft,
    colors: [
      Color(0xFF7638FA),
      Color(0xFFD300C5),
      Color(0xFFFF0069),
      Color(0xFFFF7A00),
      Color(0xFFFFD600),
    ],
    stops: [0, 0.17, 0.36, 0.625, 0.835],
  );

  static final ColorScheme colorSchemeLight = createColorScheme(
    Brightness.light,
  );

  static final ColorScheme colorSchemeDark = createColorScheme(Brightness.dark);

  static ColorScheme createColorScheme(Brightness brightness) {
    return brightness == Brightness.light
        ? ColorScheme.fromSeed(
            seedColor: PRIMARY_COLOR,
            primary: PRIMARY_COLOR,
            brightness: brightness,
          )
        : ColorScheme.fromSeed(
            seedColor: PRIMARY_COLOR,
            primary: PRIMARY_COLOR,
            brightness: brightness,
          );
  }
}
