import 'package:app_instagram_clone/cores/helpers/validations/password/abs_password_validate.dart';
import 'package:app_instagram_clone/cores/helpers/validations/password/imp_password_validate.dart';

class VoPassword {
  final String _value;

  VoPassword({required String value}) : _value = value{
    final AbsPasswordValidate passwordValidate = ImpPasswordValidate();
    final String? exception = passwordValidate.validate(value);
    if(exception != null) throw Exception(exception);
  }

  String get value => _value;
}
