import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/abstractions/abs_sign_in_input.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/usecases/sign_in/strategy/abstractions/abs_sign_in_strategy.dart';

class SignInUsecase<T extends AbsSignInInput> {
  final AbsSignInStrategy _absSignInStrategy;

  const SignInUsecase({required AbsSignInStrategy absSignInStrategy}) : _absSignInStrategy = absSignInStrategy;

  Future<AuthTokenEntity> executed(T input){
    return _absSignInStrategy.signIn(input);
  }
}