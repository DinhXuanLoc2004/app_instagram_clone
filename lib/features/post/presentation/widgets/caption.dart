import 'package:app_instagram_clone/configs/logger/log.dart';
import 'package:app_instagram_clone/cores/widgets/texts/read_more_text.dart';
import 'package:flutter/material.dart';

class Caption extends StatelessWidget {
  const Caption({super.key, required String name, required String caption})
    : _name = name,
      _caption = caption;

  final String _name;
  final String _caption;

  InlineSpan _buildTextSpan(ColorScheme colorScheme) {
    return TextSpan(
      text: '$_name ',
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.13,
        color: colorScheme.onSurface,
      ),
      children: [
        TextSpan(
          text: _caption,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 0.26,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ReadMoreText(
        preDataText: _name,
        preDataTextStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.13,
          color: colorScheme.onSurface,
        ),
        _caption,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          letterSpacing: 0.26,
        ),
        trimMode: TrimMode.Line,
        trimLines: 2,
        textAlign: TextAlign.start,
        trimCollapsedText: 'more',
        trimExpandedText: '',
      ),
    );
  }
}
