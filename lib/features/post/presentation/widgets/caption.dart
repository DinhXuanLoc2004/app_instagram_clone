import 'package:flutter/material.dart';

class Caption extends StatelessWidget {
  const Caption({super.key, required String name, required String caption})
    : _name = name,
      _caption = caption;

  final String _name;
  final String _caption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: '$_name ',
          style:  TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.13,
            color: Theme.of(context).colorScheme.onSurface
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
        ),
      ),
    );
  }
}
