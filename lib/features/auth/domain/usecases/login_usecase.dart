import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abstract_auth_repository.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/login_input.dart';

class LoginUsecase {
  final AbstractAuthRepository authRepository;

  const LoginUsecase({required this.authRepository});

  Future<AuthTokenEntity> executed(LoginInput input) async{
    final AuthTokenEntity authTokenEntity = await authRepository.login(input);
    authRepository.saveLocal(authTokenEntity);
    return authTokenEntity;
  }
}