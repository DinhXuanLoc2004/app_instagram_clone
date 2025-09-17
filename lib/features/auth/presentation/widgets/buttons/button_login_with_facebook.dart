import 'package:app_instagram_clone/configs/translations/generated/locale_keys.g.dart';
import 'package:app_instagram_clone/cores/widgets/button_base.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLoginWithFacebook extends StatelessWidget {
  const ButtonLoginWithFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'F',
            style: GoogleFonts.poppins(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w700
            ),
          ),
          const SizedBox(width: 10),
          Text(
            LocaleKeys.auth_continue_with.tr(args: ['Facebook']),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
