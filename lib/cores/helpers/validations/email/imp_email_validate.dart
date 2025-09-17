import 'package:app_instagram_clone/configs/translations/generated/locale_keys.g.dart';
import 'package:app_instagram_clone/cores/helpers/validations/email/abs_email_validate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AbsEmailValidate)
class ImpEmailValidate implements AbsEmailValidate {

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.auth_validate_please_email.tr();
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return LocaleKeys.auth_validate_email.tr();
    }

    return null;
  }
  
}