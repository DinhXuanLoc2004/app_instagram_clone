import 'package:app_instagram_clone/cores/configs/translations/generated/locale_keys.g.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/buttons/button_go_to_signin_or_signup.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/buttons/button_login_with_facebook.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/buttons/button_select_languege.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/form_login.dart';
import 'package:app_instagram_clone/cores/widgets/logo_text_instagram.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/widget_or.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  PreferredSizeWidget _buidAppBar() {
    return AppBar(title: ButtonSelectLanguege(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buidAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const LogoTextInstagram(),
                  const SizedBox(height: 65),
                  // ignore: prefer_const_constructors
                  ButtonLoginWithFacebook(),
                  const SizedBox(height: 35),
                  const WidgetOr(),
                  const SizedBox(height: 40),
                  // ignore: prefer_const_constructors
                  FormLogin(),
                  const SizedBox(height: 30),
                  ButtonGoToSigninOrSignup(
                    title: LocaleKeys.auth_dont_have_an_account.tr(),
                    goToPage: LocaleKeys.auth_sign_up.tr(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
