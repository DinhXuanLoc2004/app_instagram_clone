import 'package:flutter/material.dart';

class ButtonBase extends StatelessWidget {
  const ButtonBase({
    super.key,
    required void Function() onPressed,
    required Widget child,
    ButtonStyle? style,
  }) : _style = style, _child = child, _onPressed = onPressed;

  final VoidCallback _onPressed;

  final Widget _child;

  final ButtonStyle? _style;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return ElevatedButton(
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: colorScheme.primary,
      ).merge(_style),
      child: _child,
    );
  }
}
