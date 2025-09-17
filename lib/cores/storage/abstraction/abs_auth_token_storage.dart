import 'package:app_instagram_clone/cores/storage/model/auth_token_model.dart';

abstract class AbsAuthTokenStorage {
  Future<void> saveToken(AuthTokenModel token);

  Future<AuthTokenModel?> readToken();

  Future<void> deleteToken();
}