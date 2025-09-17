import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/extendtions/sign_in_with_userpass_input.dart';

abstract class AbsAuthRepository {
  Future<AuthTokenEntity> signInWithUserpass(SignInWithUserpassInput input);
  Future<void> saveAuthToken(AuthTokenEntity entity);
}