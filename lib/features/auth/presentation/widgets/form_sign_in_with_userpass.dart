import 'package:app_instagram_clone/configs/translations/generated/locale_keys.g.dart';
import 'package:app_instagram_clone/cores/helpers/validations/email/abs_email_validate.dart';
import 'package:app_instagram_clone/cores/helpers/validations/password/abs_password_validate.dart';
import 'package:app_instagram_clone/cores/widgets/buttons/button_base.dart';
import 'package:app_instagram_clone/cores/widgets/edit_text/text_form_field_base.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FormSignInWithUserpass extends StatelessWidget {
  const FormSignInWithUserpass({
    super.key,
    required AbsEmailValidate emailValidate,
    required AbsPasswordValidate passwordValidate,
    required VoidCallback actionSignInWithUserpass,
    required VoidCallback actionForgotPassword,
    required FocusNode focusNodeEmail,
    required FocusNode focusNodePassword,
    required TextEditingController controllerEmail,
    required TextEditingController controllerPassword,
    required GlobalKey<FormState> formKey,
    required bool isLoading
  }) : _emailValidate = emailValidate,
       _passwordValidate = passwordValidate,
       _actionSignInWithUserpass = actionSignInWithUserpass,
       _actionForgotPassword = actionForgotPassword,
       _focusNodeEmail = focusNodeEmail,
       _focusNodePassword = focusNodePassword,
       _controllerEmail = controllerEmail,
       _controllerPassword = controllerPassword,
       _formKey = formKey,
       _isLoading = isLoading;

  final AbsEmailValidate _emailValidate;
  final AbsPasswordValidate _passwordValidate;
  final VoidCallback _actionSignInWithUserpass;
  final VoidCallback _actionForgotPassword;

  final FocusNode _focusNodeEmail;
  final FocusNode _focusNodePassword;
  final TextEditingController _controllerEmail;
  final TextEditingController _controllerPassword;

  final GlobalKey<FormState> _formKey;

  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        key: ValueKey(EasyLocalization.of(context)!.locale),
        children: [
          TextFormFieldBase(
            controller: _controllerEmail,
            focusNode: _focusNodeEmail,
            hintText: LocaleKeys.auth_text_field_email.tr(),
            validator: _emailValidate.validate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 8),
          TextFormFieldBase(
            controller: _controllerPassword,
            focusNode: _focusNodePassword,
            hintText: LocaleKeys.auth_text_field_password.tr(),
            validator: _passwordValidate.validate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _actionForgotPassword,
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
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ButtonBase(
              isLoading: _isLoading,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _actionSignInWithUserpass();
                }
                // _focusNodeEmail.requestFocus();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              child: Text(
                LocaleKeys.auth_log_in.tr(),
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
