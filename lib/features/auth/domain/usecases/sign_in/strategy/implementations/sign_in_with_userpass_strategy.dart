import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abs_auth_repository.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/extendtions/sign_in_with_userpass_input.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/usecases/sign_in/strategy/abstractions/abs_sign_in_strategy.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInWithUserpassStrategy
    implements AbsSignInStrategy<SignInWithUserpassInput> {

  final AbsAuthRepository _authRepository;

  const SignInWithUserpassStrategy({required AbsAuthRepository authRepository}) : _authRepository = authRepository;
  
  @override
  Future<AuthTokenEntity> signIn(SignInWithUserpassInput input) async{
    final AuthTokenEntity entity = await _authRepository.signInWithUserpass(input);
    await _authRepository.saveAuthToken(entity);
    return entity;
  }
}
