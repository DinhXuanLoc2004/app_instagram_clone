import 'package:flutter/material.dart';

class ButtonBase extends StatelessWidget {
  const ButtonBase({
    super.key,
    required void Function() onPressed,
    required Widget child,
    ButtonStyle? style,
    bool? isLoading,
  }) : _style = style,
       _child = child,
       _onPressed = onPressed,
       _isLoading = isLoading ?? false;

  final VoidCallback _onPressed;

  final Widget _child;

  final ButtonStyle? _style;

  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return ElevatedButton(
      onPressed: _isLoading ? null : _onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: colorScheme.primary,
      ).merge(_style),
      child: _isLoading
          ? const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(color: Colors.white),
            )
          : _child,
    );
  }
}
