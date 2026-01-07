import 'package:app_instagram_clone/cores/storage/abstraction/abs_auth_token_storage.dart';
import 'package:app_instagram_clone/cores/storage/model/auth_token_model.dart';
import 'package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart';
import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abs_token_repository.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AbsTokenRepository)
final class ImpTokenRepository extends AbsTokenRepository {
  final AbsAuthTokenStorage _tokenStorage;
  final AuthMapper _mappr;

  ImpTokenRepository({
    required AbsAuthTokenStorage tokenStorage,
    required AuthMapper mappr,
  }) : _tokenStorage = tokenStorage,
       _mappr = mappr;

  @override
  Future<void> saveAuthToken(AuthTokenEntity entity) async {
    final AuthTokenModel tokenModel = entity.toModel();
    await _tokenStorage.saveToken(tokenModel);
  }
  
  @override
  Future<void> deleteAuthToken() async{
    await _tokenStorage.deleteToken();
  }
  
  @override
  Future<AuthTokenEntity?> readToken() async{
    final result = await _tokenStorage.readToken();
    return result?.toEntity();
  }
}
