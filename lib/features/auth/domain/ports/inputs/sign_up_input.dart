import 'package:app_instagram_clone/features/auth/domain/value_objects/vo_email.dart';
import 'package:app_instagram_clone/features/auth/domain/value_objects/vo_password.dart';

class SignUpInput {
  final VoEmail _email;
  final VoPassword _password;

  SignUpInput({
    required String email,
    required String password
  }) : _email = VoEmail(value: email), _password = VoPassword(value: password);

  String get email => _email.value;

  String get password => _password.value;
}