import 'package:flutter/material.dart';

class ButtonGoToSigninOrSignup extends StatelessWidget {
  const ButtonGoToSigninOrSignup({
    super.key,
    required String title,
    required String goToPage,
    required VoidCallback action,
  }) : _goToPage = goToPage,
       _title = title,
       _action = action;

  final String _title;
  final String _goToPage;
  final VoidCallback _action;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return TextButton(
      onPressed: _action,
      child: RichText(
        text: TextSpan(
          text: _title,
          style: TextStyle(
            color: colorScheme.outline,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
          children: [
            TextSpan(
              text: ' $_goToPage',
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
