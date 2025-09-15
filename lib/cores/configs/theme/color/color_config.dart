import 'package:flutter/material.dart';

abstract class ColorConfig {
  static const Color PRIMARY_COLOR = Color(0xFF1877F2);

  static ColorScheme colorSchemeLight = createColorScheme(Brightness.light);

  static ColorScheme colorSchemeDark = createColorScheme(Brightness.dark);

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
