import 'package:app_instagram_clone/configs/translations/generated/locale_keys.g.dart';
import 'package:app_instagram_clone/cores/helpers/validations/password/abs_password_validate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AbsPasswordValidate)
class ImpPasswordValidate implements AbsPasswordValidate{

  @override
  String? validate(String? value) {
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