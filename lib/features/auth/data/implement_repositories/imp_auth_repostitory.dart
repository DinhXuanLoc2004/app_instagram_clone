import 'package:app_instagram_clone/configs/logger/log.dart';
import 'package:app_instagram_clone/configs/network/extras/option_extra.dart';
import 'package:app_instagram_clone/configs/network/responses/successful/success_wrapper.dart';
import 'package:app_instagram_clone/cores/error/failure.dart';
import 'package:app_instagram_clone/cores/helpers/result/handle_result.dart';
import 'package:app_instagram_clone/cores/helpers/result/result.dart';
import 'package:app_instagram_clone/cores/storage/abstraction/abs_auth_token_storage.dart';
import 'package:app_instagram_clone/cores/storage/model/auth_token_model.dart';
import 'package:app_instagram_clone/features/auth/data/DTOs/requests/sign_in_with_userpass_request.dart';
import 'package:app_instagram_clone/features/auth/data/DTOs/requests/sign_up_request.dart';
import 'package:app_instagram_clone/features/auth/data/DTOs/responses/auth_token_response.dart';
import 'package:app_instagram_clone/features/auth/data/datasources/remote/auth_datasource_remote.dart';
import 'package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart';
import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abs_auth_repository.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/extendtions/sign_in_with_userpass_input.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign_up_input.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AbsAuthRepository)
class ImpAuthRepostitory extends AbsAuthRepository {
  final AuthDatasourceRemote _authDatasourceRemote;
  final AuthMapper _authMapper;
  final OptionExtra _optionExtra;

  ImpAuthRepostitory({
    required AuthMapper authMapper,
    required AuthDatasourceRemote authDatasourceRemote,
    required AbsAuthTokenStorage absAuthTokenStorage,
  }) : _authMapper = authMapper,
       _authDatasourceRemote = authDatasourceRemote,
       _optionExtra = OptionExtra();

  @override
  Future<Result<AuthTokenEntity, Failure>> signInWithUserpass(
    SignInWithUserpassInput input,
  ) async {
    return HandleResult.asyncGuard(() async {
      final SignInWithUserpassRequest request = _authMapper.convert(input);
      final SuccessWrapper<AuthTokenResponse> response =
          await _authDatasourceRemote.signInWithUserpass(
            body: request,
            extras: _optionExtra.toJson(),
          );
      Log.debug('response:: $response');
      final AuthTokenResponse authTokenResponse = response.metadata;
      final AuthTokenEntity authTokenEntity = _authMapper.convert(
        authTokenResponse,
      );
      return authTokenEntity;
    });
  }

  @override
  Future<Result<AuthTokenEntity, Failure>> signUp(SignUpInput input) {
    return HandleResult.asyncGuard(() async {
      final SignUpRequest request = _authMapper.convert(input);
      Log.info('request:: $request');

      final response = await _authDatasourceRemote.signUp(body: request, extras: _optionExtra.toJson());
      Log.debug('response:: $response');

      final AuthTokenEntity tokenEntity = _authMapper.convert(response.metadata);
      Log.info('tokenEntity:: $tokenEntity');

      return tokenEntity;
    });
  }

  @override
  Future<Result<void, Failure>> logout(String refreshToken) {
    return HandleResult.asyncGuard(() async {
      await _authDatasourceRemote.logout(refreshToken: refreshToken, extras: _optionExtra.toJson());
      return null;
    });
  }
}
