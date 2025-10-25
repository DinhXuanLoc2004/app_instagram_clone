import 'package:flutter/material.dart';

class InkWellButton extends StatelessWidget {
  const InkWellButton({
    super.key,
    required void Function()? onPressed,
    required Widget child,
    double borderRadius = _BORDER_RADISU_DEFAULT,
  }) : _onPressed = onPressed,
       _child = child,
       _borderRadius = borderRadius;

  static const double _BORDER_RADISU_DEFAULT = 12;

  final void Function()? _onPressed;
  final Widget _child;
  final double _borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      borderRadius: BorderRadius.circular(_borderRadius),
      child: _child,
    );
  }
}
