import 'package:app_instagram_clone/configs/dependency_injection/injection.dart';
import 'package:app_instagram_clone/configs/logger/log.dart';
import 'package:app_instagram_clone/configs/routes/auth_session.dart';
import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/configs/routes/router_names.dart';
import 'package:app_instagram_clone/configs/translations/generated/locale_keys.g.dart';
import 'package:app_instagram_clone/cores/error/failure_type.dart';
import 'package:app_instagram_clone/cores/helpers/validations/email/abs_email_validate.dart';
import 'package:app_instagram_clone/cores/helpers/validations/password/abs_password_validate.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-in/sign_in_bloc.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-in/sign_in_event.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-in/sign_in_state.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/buttons/button_go_to_signin_or_signup.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/buttons/button_login_with_facebook.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/buttons/button_select_languege.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/form_auth.dart';
import 'package:app_instagram_clone/cores/widgets/logos/logo_text_instagram.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/widget_or.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AbsEmailValidate _emailValidate = getIt<AbsEmailValidate>();
  final AbsPasswordValidate _passwordValidate = getIt<AbsPasswordValidate>();
  final AuthSession _authSession = getIt<AuthSession>();

  final GlobalKey<FormState> _formKeySignInWithUserpass = GlobalKey();

  late FocusNode _focusNodeEmail;
  late FocusNode _focusNodePassword;
  late TextEditingController _controllerEmail;
  late TextEditingController _controllerPassword;

  var _isUnauthorized = false;

  @override
  void initState() {
    super.initState();
    _focusNodeEmail = FocusNode();
    _focusNodePassword = FocusNode();
    _controllerEmail = TextEditingController();
    _focusNodeEmail.addListener(() {
      if (_focusNodeEmail.hasFocus) {
        _focusNodePassword.unfocus();
      }
    });
    _controllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  PreferredSizeWidget _buidAppBar() {
    return AppBar(title: ButtonSelectLanguege(context: context));
  }

  void _signInWithUserpass(BuildContext context) {
    context.read<SignInBloc>().add(
      SignInWithUserpassEvent(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      ),
    );
  }

  void _onChangeText() {
    if (_isUnauthorized) {
      context.read<SignInBloc>().add(ClearUnauthorizedEvent());
    }
  }

  void _forgotPassword() {}

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
                  BlocConsumer<SignInBloc, SignInState>(
                    listener: (context, state) {
                      state.whenOrNull(success: _authSession.onAuthorized);
                    },
                    buildWhen: (previous, current) => true,
                    builder: (BuildContext context, SignInState state) {
                      final bool isLoading = state.maybeWhen(
                        userpassLoading: () => true,
                        orElse: () => false,
                      );
                      _isUnauthorized = state.maybeWhen(
                        userpassFailure: (failureType, message) =>
                            failureType == FailureType.unauthorized
                            ? true
                            : false,
                        orElse: () => false,
                      );
                      return FormAuth(
                        emailValidate: _emailValidate,
                        passwordValidate: _passwordValidate,
                        actionAuth: () => _signInWithUserpass(context),
                        actionForgotPassword: _forgotPassword,
                        focusNodeEmail: _focusNodeEmail,
                        focusNodePassword: _focusNodePassword,
                        controllerEmail: _controllerEmail,
                        controllerPassword: _controllerPassword,
                        onChangedEmail: (_) => _onChangeText(),
                        onChangedPassword: (_) => _onChangeText(),
                        formKey: _formKeySignInWithUserpass,
                        isLoading: isLoading,
                        isUnauthorized: _isUnauthorized,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  ButtonGoToSigninOrSignup(
                    title: LocaleKeys.auth_dont_have_an_account.tr(),
                    goToPage: LocaleKeys.auth_sign_up.tr(),
                    action: () => context.goNamed(RouterEnum.signUp.name),
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
