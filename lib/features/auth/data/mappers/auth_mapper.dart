import 'package:app_instagram_clone/cores/storage/model/auth_token_model.dart';
import 'package:app_instagram_clone/features/auth/data/DTOs/requests/sign_in_with_userpass_request.dart';
import 'package:app_instagram_clone/features/auth/data/DTOs/responses/auth_token_response.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/extendtions/sign_in_with_userpass_input.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:app_instagram_clone/features/auth/data/mappers/auth_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<SignInWithUserpassRequest, SignInWithUserpassInput>(),
  MapType<SignInWithUserpassInput, SignInWithUserpassRequest>(),
  MapType<AuthTokenResponse, AuthTokenEntity>(),
  MapType<AuthTokenEntity, AuthTokenResponse>(),
  MapType<AuthTokenEntity, AuthTokenModel>()
])
@lazySingleton
class AuthMapper extends $AuthMapper {}
