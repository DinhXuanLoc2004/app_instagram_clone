import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/abstractions/abs_sign_in_input.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';

abstract class AbsSignInStrategy<T extends AbsSignInInput> {
  Future<AuthTokenEntity> signIn(T input);
}