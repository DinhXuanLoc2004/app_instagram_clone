import 'package:flutter/material.dart';

class ButtonGoToSigninOrSignup extends StatelessWidget {
  const ButtonGoToSigninOrSignup({
    super.key,
    required this.title,
    required this.goToPage,
  });

  final String title;
  final String goToPage;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return TextButton(
      onPressed: () {},
      child: RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(
            color: colorScheme.outline,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
          children: [
            TextSpan(
              text: ' $goToPage',
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
