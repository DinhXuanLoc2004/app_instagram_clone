import 'package:flutter/material.dart';

abstract class TextThemeConfig {
  static const TextTheme TEXT_THEME = TextTheme(
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    labelLarge: TextStyle(fontSize: 13),
    labelSmall: TextStyle(fontSize: 11),
  );
}
