import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/abstractions/abs_sign_in_input.dart';

class SignInWithUserpassInput extends AbsSignInInput {
  final String email;
  final String password;

  const SignInWithUserpassInput({required this.email, required this.password});
}
