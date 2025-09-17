import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoTextInstagram extends StatelessWidget {
  const LogoTextInstagram({super.key, double? fontSize = _FONT_SIZE_DEFAULT})
    : _fontSize = fontSize;

  static const String _CONTENT = 'Instagram';
  static const double _FONT_SIZE_DEFAULT = 45;

  final double? _fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(_CONTENT, style: GoogleFonts.lobster(fontSize: _fontSize));
  }
}
