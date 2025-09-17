import 'package:app_instagram_clone/configs/translations/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ValidatorForm {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.auth_validate_please_email.tr();
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return LocaleKeys.auth_validate_email.tr();
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.auth_validate_please_password.tr();
    }

    if (value.length < 6) {
      return LocaleKeys.auth_validate_length_password.tr();
    }

    final hasUppercase = RegExp(r'[A-Z]');
    if (!hasUppercase.hasMatch(value)) {
      return LocaleKeys.auth_validate_uppercase_password.tr();
    }

    return null;
  }
}
