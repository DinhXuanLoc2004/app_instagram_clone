import 'package:flutter/material.dart';

enum Locales {
  vi_VI(locale: Locale('vi')),
  en_US(locale: Locale('en'));

  const Locales({required this.locale});
  final Locale locale;
}
