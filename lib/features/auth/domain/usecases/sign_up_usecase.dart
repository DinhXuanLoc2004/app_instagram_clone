import 'package:app_instagram_clone/cores/error/failure.dart';
import 'package:app_instagram_clone/cores/helpers/result/result.dart';
import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abs_auth_repository.dart';
import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abs_token_repository.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign_up_input.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpUsecase {
  final AbsAuthRepository _authRepository;
  final AbsTokenRepository _tokenRepository;

  const SignUpUsecase({
    required AbsAuthRepository authRepository,
    required AbsTokenRepository tokenRepository,
  }) : _authRepository = authRepository,
       _tokenRepository = tokenRepository;

  Future<Result<AuthTokenEntity, Failure>> executed(SignUpInput input) async {
    final result = await _authRepository.signUp(input);
    if (result case Success(:final data)) {
      await _tokenRepository.saveAuthToken(data);
    }
    return result;
  }
}
