import 'package:app_instagram_clone/cores/widgets/buttons/ink_well_button.dart';
import 'package:app_instagram_clone/cores/widgets/icons/icon_message_circle.dart';
import 'package:app_instagram_clone/cores/widgets/logos/logo_text_instagram.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class FeedAppBar extends StatelessWidget {
  const FeedAppBar({super.key});

  Widget _buildLeading(ColorScheme colorScheme) {
    return InkWellButton(
      onPressed: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoTextInstagram(
            fontSize: 25,
            textStyle: TextStyle(color: colorScheme.onSurface),
          ),
          const SizedBox(width: 3),
          Icon(
            Symbols.keyboard_arrow_down,
            color: colorScheme.onSurface,
            size: 23,
            weight: 400,
          ),
        ],
      ),
    );
  }

  Widget _buildActions(ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWellButton(
          onPressed: () {},
          child: Icon(
            Symbols.favorite,
            color: colorScheme.onSurface,
            weight: 700,
          ),
        ),
        const SizedBox(width: 16),
        InkWellButton(onPressed: () {}, child: const IconMessageCircle()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_buildLeading(colorScheme), _buildActions(colorScheme)],
      ),
    );
  }
}
