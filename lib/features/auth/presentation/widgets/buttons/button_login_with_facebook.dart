import 'package:app_instagram_clone/configs/dependency_injection/injection.dart';
import 'package:app_instagram_clone/configs/routes/auth_session.dart';
import 'package:app_instagram_clone/configs/translations/generated/locale_keys.g.dart';
import 'package:app_instagram_clone/cores/widgets/buttons/button_base.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-in/sign_in_bloc.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-in/sign_in_event.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-in/sign_in_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLoginWithFacebook extends StatelessWidget {
  ButtonLoginWithFacebook({super.key});

  final AuthSession _authSession = getIt<AuthSession>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      builder: (BuildContext context, SignInState state) {
        final isLoading = state.maybeWhen(
          facebookLoading: () => true,
          orElse: () => false,
        );

        return SizedBox(
          width: double.infinity,
          child: ButtonBase(
            onPressed: () {
              context.read<SignInBloc>().add(SignInWithFBEvent());
            },
            isLoading: isLoading,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'F',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  LocaleKeys.auth_continue_with.tr(args: ['Facebook']),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, state) {
        state.whenOrNull(success: _authSession.onAuthorized);
      },
    );
  }
}
