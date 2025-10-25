import 'package:app_instagram_clone/cores/widgets/buttons/ink_well_button.dart';
import 'package:flutter/material.dart';

class TextButtonIcon extends StatelessWidget {
  const TextButtonIcon({
    super.key,
    required void Function()? onPressed,
    required Widget icon,
    required String lable,
  }) : _onPressed = onPressed,
       _icon = icon,
       _lable = lable;

  final void Function()? _onPressed;
  final Widget _icon;
  final String _lable;

  Widget _buildChild() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _icon,
        const SizedBox(width: 3,),
        Text(
          _lable,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.24,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWellButton(onPressed: _onPressed, child: _buildChild());
  }
}
