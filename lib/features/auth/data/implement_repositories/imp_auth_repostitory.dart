import 'package:app_instagram_clone/cores/storage/abstraction/abs_auth_token_storage.dart';
import 'package:app_instagram_clone/cores/storage/model/auth_token_model.dart';
import 'package:app_instagram_clone/features/auth/data/DTOs/requests/sign_in_with_userpass_request.dart';
import 'package:app_instagram_clone/features/auth/data/DTOs/responses/jwt_response.dart';
import 'package:app_instagram_clone/features/auth/data/datasources/remote/auth_datasource_remote.dart';
import 'package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart';
import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abs_auth_repository.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/extendtions/sign_in_with_userpass_input.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AbsAuthRepository)
class ImpAuthRepostitory extends AbsAuthRepository {
  final AuthDatasourceRemote _authDatasourceRemote;
  final AuthMapper _authMapper;
  final AbsAuthTokenStorage _absAuthTokenStorage;

  ImpAuthRepostitory({
    required AuthMapper authMapper,
    required AuthDatasourceRemote authDatasourceRemote,
    required AbsAuthTokenStorage absAuthTokenStorage
  }) : _authMapper = authMapper,
       _authDatasourceRemote = authDatasourceRemote,
       _absAuthTokenStorage = absAuthTokenStorage;

  @override
  Future<AuthTokenEntity> signInWithUserpass(SignInWithUserpassInput input) async{
    final SignInWithUserpassRequest request = _authMapper.convert(input);
    final JwtResponse response = await _authDatasourceRemote.signInWithUserpass(request);
    final AuthTokenEntity jwtOutput = _authMapper.convert(response);
    return jwtOutput;
  }

  @override
  Future<void> saveAuthToken(AuthTokenEntity entity) async{
    final AuthTokenModel tokenModel = _authMapper.convert(entity);
    await _absAuthTokenStorage.saveToken(tokenModel);
  }
}
