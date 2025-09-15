import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/login_input.dart';

abstract class AbstractAuthRepository {
  Future<AuthTokenEntity> login(LoginInput input);
  bool saveLocal(AuthTokenEntity entity);
}