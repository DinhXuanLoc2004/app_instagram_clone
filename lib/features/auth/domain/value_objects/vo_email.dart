import 'package:app_instagram_clone/cores/helpers/validations/email/abs_email_validate.dart';
import 'package:app_instagram_clone/cores/helpers/validations/email/imp_email_validate.dart';

class VoEmail {
  final String _value;

  VoEmail({required String value}) : _value = value {
    final AbsEmailValidate emailValidate = ImpEmailValidate();
    final String? exception = emailValidate.validate(value);
    if(exception != null) throw Exception(exception);
  }

  String get value => _value;
}
