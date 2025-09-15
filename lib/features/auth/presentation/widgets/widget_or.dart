import 'package:flutter/material.dart';

class WidgetOr extends StatelessWidget {
  const WidgetOr({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final Color colorContent = colorScheme.outline;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Container(color: colorContent, height: 1),
          ),
        ),
        Text(
          'OR',
          style: TextStyle(
            color: colorContent,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Container(height: 1, color: colorContent),
          ),
        ),
      ],
    );
  }
}
