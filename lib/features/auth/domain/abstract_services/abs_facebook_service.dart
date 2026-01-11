import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/extendtions/sign_in_with_facebook_input.dart';

abstract class AbsFacebookService {
  Future<SignInWithFacebookInput?> getAuthenticationToken();
}