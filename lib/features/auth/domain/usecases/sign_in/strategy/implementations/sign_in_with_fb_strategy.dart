import 'package:app_instagram_clone/cores/error/custom_exceptions.dart';
import 'package:app_instagram_clone/cores/error/failure.dart';
import 'package:app_instagram_clone/cores/helpers/result/result.dart';
import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abs_auth_repository.dart';
import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abs_token_repository.dart';
import 'package:app_instagram_clone/features/auth/domain/abstract_services/abs_facebook_service.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/usecases/sign_in/strategy/abstractions/abs_sign_in_strategy.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInWithFBStrategy implements AbsSignInStrategy<Null> {
  final AbsAuthRepository _authRepository;
  final AbsTokenRepository _tokenRepository;
  final AbsFacebookService _facebookService;

  const SignInWithFBStrategy({
    required AbsAuthRepository authRepository,
    required AbsTokenRepository tokenRepository,
    required AbsFacebookService facebookService,
  }) : _authRepository = authRepository,
       _tokenRepository = tokenRepository,
       _facebookService = facebookService;

  @override
  Future<Result<AuthTokenEntity, Failure>> signIn(Null noInput) async {
    final input = await _facebookService.getAuthenticationToken();

    if (input == null) {
      return Result.exception(
        Failure.mapExceptionToFailure(
          const UnauthorizedException(message: 'authTokenFacebook == null'),
        ),
      );
    }

    final result = await _authRepository.signInWithFacebook(input);

    if (result case Success(:final data)) {
      await _tokenRepository.saveAuthToken(data);
    }

    return result;
  }
}
