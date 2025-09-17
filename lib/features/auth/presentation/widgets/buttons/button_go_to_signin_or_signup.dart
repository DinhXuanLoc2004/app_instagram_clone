import 'package:flutter/material.dart';

class ButtonGoToSigninOrSignup extends StatelessWidget {
  const ButtonGoToSigninOrSignup({
    super.key,
    required String title,
    required String goToPage,
  }) : _goToPage = goToPage, _title = title;

  final String _title;
  final String _goToPage;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return TextButton(
      onPressed: () {},
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
