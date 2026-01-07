import 'package:app_instagram_clone/configs/translations/generated/locale_keys.g.dart';
import 'package:app_instagram_clone/cores/helpers/validations/email/abs_email_validate.dart';
import 'package:app_instagram_clone/cores/helpers/validations/password/abs_password_validate.dart';
import 'package:app_instagram_clone/cores/widgets/buttons/button_base.dart';
import 'package:app_instagram_clone/cores/widgets/edit_text/text_form_field_base.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FormAuth extends StatefulWidget {
  const FormAuth({
    super.key,
    required AbsEmailValidate emailValidate,
    required AbsPasswordValidate passwordValidate,
    required VoidCallback actionAuth,
    VoidCallback? actionForgotPassword,
    required FocusNode focusNodeEmail,
    required FocusNode focusNodePassword,
    required TextEditingController controllerEmail,
    required TextEditingController controllerPassword,
    Function(String)? onChangedEmail,
    Function(String)? onChangedPassword,
    required GlobalKey<FormState> formKey,
    required bool isLoading,
    bool isUnauthorized = false,
    bool isSignInPage = true,
    bool isBadRequest = false,
  }) : _emailValidate = emailValidate,
       _passwordValidate = passwordValidate,
       _actionAuth = actionAuth,
       _actionForgotPassword = actionForgotPassword,
       _focusNodeEmail = focusNodeEmail,
       _focusNodePassword = focusNodePassword,
       _controllerEmail = controllerEmail,
       _controllerPassword = controllerPassword,
       _onChangedEmail = onChangedEmail,
       _onChangedPassword = onChangedPassword,
       _formKey = formKey,
       _isLoading = isLoading,
       _isUnauthorized = isUnauthorized,
       _isSignInPage = isSignInPage,
       _isBadRequest = isBadRequest;

  final AbsEmailValidate _emailValidate;
  final AbsPasswordValidate _passwordValidate;
  final VoidCallback _actionAuth;
  final VoidCallback? _actionForgotPassword;

  final FocusNode _focusNodeEmail;
  final FocusNode _focusNodePassword;
  final TextEditingController _controllerEmail;
  final TextEditingController _controllerPassword;
  final Function(String)? _onChangedEmail;
  final Function(String)? _onChangedPassword;

  final GlobalKey<FormState> _formKey;

  final bool _isLoading;
  final bool _isUnauthorized;
  final bool _isSignInPage;
  final bool _isBadRequest;

  @override
  State<FormAuth> createState() => _FormAuthState();
}

class _FormAuthState extends State<FormAuth> {
  Widget _buildIncorrectSub() {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return widget._isUnauthorized && widget._isSignInPage
        ? Column(
            children: [
              const SizedBox(height: 8),
              Text(
                LocaleKeys.auth_incorrect_sub.tr(),
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.455,
                  color: colorScheme.error,
                ),
              ),
            ],
          )
        : const SizedBox();
  }

  Widget _buildForgotPassword() {
    return widget._isSignInPage
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: widget._actionForgotPassword,
                child: Text(
                  LocaleKeys.auth_forgot_password.tr(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.455,
                  ),
                ),
              ),
            ],
          )
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        key: ValueKey(EasyLocalization.of(context)!.locale),
        children: [
          TextFormFieldBase(
            controller: widget._controllerEmail,
            focusNode: widget._focusNodeEmail,
            onChanged: widget._onChangedEmail,
            hintText: LocaleKeys.auth_text_field_email.tr(),
            validator: widget._emailValidate.validate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isUnauthorized: widget._isUnauthorized,
            isBadRequest: widget._isBadRequest,
          ),
          const SizedBox(height: 8),
          TextFormFieldBase(
            controller: widget._controllerPassword,
            focusNode: widget._focusNodePassword,
            onChanged: widget._onChangedPassword,
            hintText: LocaleKeys.auth_text_field_password.tr(),
            validator: widget._passwordValidate.validate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: true,
            isUnauthorized: widget._isUnauthorized,
          ),
          _buildIncorrectSub(),
          _buildForgotPassword(),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ButtonBase(
              isLoading: widget._isLoading,
              onPressed: () {
                if (widget._formKey.currentState!.validate()) {
                  widget._actionAuth();
                }
                // _focusNodeEmail.requestFocus();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              child: Text(
                widget._isSignInPage ? LocaleKeys.auth_log_in.tr() : LocaleKeys.auth_sign_up.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
