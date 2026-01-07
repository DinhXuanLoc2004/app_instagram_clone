import 'package:app_instagram_clone/cores/error/custom_exceptions.dart';
import 'package:app_instagram_clone/cores/error/failure.dart';
import 'package:app_instagram_clone/cores/error/failure_type.dart';
import 'package:app_instagram_clone/cores/helpers/result/result.dart';
import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abs_auth_repository.dart';
import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abs_token_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
final class LogoutUsecase {
  final AbsAuthRepository _authRepository;
  final AbsTokenRepository _tokenRepository;

  LogoutUsecase({
    required AbsAuthRepository authRepository,
    required AbsTokenRepository tokenRepository,
  }) : _authRepository = authRepository,
       _tokenRepository = tokenRepository;

  Future<Result<void, Failure>> executed() async {
    final tokenEntity = await _tokenRepository.readToken();
          if (tokenEntity != null) {
        await _authRepository.logout(tokenEntity.refreshToken);
      }

      await _tokenRepository.deleteAuthToken();

      return const Result.success(null);
  }
}
