import 'package:app_instagram_clone/configs/dependency_injection/injection.dart';
import 'package:app_instagram_clone/configs/routes/auth_session.dart';
import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/configs/translations/generated/locale_keys.g.dart';
import 'package:app_instagram_clone/cores/error/failure_type.dart';
import 'package:app_instagram_clone/cores/helpers/validations/email/abs_email_validate.dart';
import 'package:app_instagram_clone/cores/helpers/validations/password/abs_password_validate.dart';
import 'package:app_instagram_clone/cores/widgets/logos/logo_text_instagram.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-up/sign_up_bloc.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-up/sign_up_event.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-up/sign_up_state.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/buttons/button_go_to_signin_or_signup.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/buttons/button_login_with_facebook.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/buttons/button_select_languege.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/form_auth.dart';
import 'package:app_instagram_clone/features/auth/presentation/widgets/widget_or.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _authSession = getIt<AuthSession>();
  final AbsEmailValidate _emailValidate = getIt<AbsEmailValidate>();
  final AbsPasswordValidate _passwordValidate = getIt<AbsPasswordValidate>();

  final GlobalKey<FormState> _formKey = GlobalKey();

  late FocusNode _focusNodeEmail;
  late FocusNode _focusNodePassword;
  late TextEditingController _controllerEmail;
  late TextEditingController _controllerPassword;

  @override
  void initState() {
    super.initState();
    _focusNodeEmail = FocusNode();
    _focusNodePassword = FocusNode();
    _controllerEmail = TextEditingController();
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

  var _isBadRequest = false;

  void _signUp() {
    context.read<SignUpBloc>().add(
      CreateAccountEvent(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      ),
    );
  }

  void _onChangeTextEmail() {
    if (_isBadRequest) {
      context.read<SignUpBloc>().add(ClearBadRequestEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ButtonSelectLanguege(context: context)),
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
                  BlocConsumer<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );

                      _isBadRequest = state.maybeWhen(
                        failure: (failureType, message) =>
                            failureType == FailureType.badRequest
                            ? true
                            : false,
                        orElse: () => false,
                      );
                      return FormAuth(
                        isSignInPage: false,
                        emailValidate: _emailValidate,
                        passwordValidate: _passwordValidate,
                        actionAuth: _signUp,
                        focusNodeEmail: _focusNodeEmail,
                        focusNodePassword: _focusNodePassword,
                        controllerEmail: _controllerEmail,
                        controllerPassword: _controllerPassword,
                        onChangedEmail: (_) => _onChangeTextEmail(),
                        formKey: _formKey,
                        isLoading: isLoading,
                        isBadRequest: _isBadRequest,
                      );
                    },
                    listener: (context, state) {
                      state.whenOrNull(
                        success: _authSession.onAuthorized,
                        failure: (failureType, message) {
                          if (failureType == FailureType.badRequest) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _focusNodeEmail.requestFocus();
                              _focusNodePassword.unfocus();
                            });
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  ButtonGoToSigninOrSignup(
                    title: LocaleKeys.auth_already_have_an_account.tr(),
                    goToPage: LocaleKeys.auth_log_in.tr(),
                    action: () => context.goNamed(RouterEnum.signIn.name),
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
