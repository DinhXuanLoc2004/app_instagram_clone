import 'package:app_instagram_clone/cores/configs/translations/generated/locale_keys.g.dart';
import 'package:app_instagram_clone/cores/helpers/validations/validator_form.dart';
import 'package:app_instagram_clone/cores/widgets/button_base.dart';
import 'package:app_instagram_clone/cores/widgets/text_form_field_base.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  void _login() {}

  void _forgotPassword() {}

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
            validator: (value) => ValidatorForm().validateEmail(value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 8),
          TextFormFieldBase(
            controller: _controllerPassword,
            focusNode: _focusNodePassword,
            hintText: LocaleKeys.auth_text_field_password.tr(),
            validator: (value) => ValidatorForm().validatePassword(value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _forgotPassword,
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _login();
                }
                _focusNodeEmail.requestFocus();
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
