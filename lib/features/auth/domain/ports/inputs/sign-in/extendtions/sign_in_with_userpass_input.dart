import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/abstractions/abs_sign_in_input.dart';
import 'package:app_instagram_clone/features/auth/domain/value_objects/vo_email.dart';
import 'package:app_instagram_clone/features/auth/domain/value_objects/vo_password.dart';

class SignInWithUserpassInput extends AbsSignInInput {
  final VoEmail _email;
  final VoPassword _password;

  SignInWithUserpassInput({required String email, required String password})
    : _email = VoEmail(value: email), _password = VoPassword(value: password);

  String get email => _email.value;

  String get password => _password.value;
}
