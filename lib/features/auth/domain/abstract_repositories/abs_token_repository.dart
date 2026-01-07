import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';

abstract class AbsTokenRepository {
  Future<AuthTokenEntity?> readToken();
  Future<void> saveAuthToken(AuthTokenEntity entity);
  Future<void> deleteAuthToken();
}