import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoTextInstagram extends StatelessWidget {
  const LogoTextInstagram({super.key, this.fontSize = 45});

  static const String CONTENT = 'Instagram';

  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(CONTENT, style: GoogleFonts.lobster(fontSize: fontSize));
  }
}
