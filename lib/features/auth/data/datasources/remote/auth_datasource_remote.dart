import 'package:app_instagram_clone/configs/network/responses/successful/successful_response_wrapper.dart';
import 'package:app_instagram_clone/features/auth/data/DTOs/requests/sign_in_with_userpass_request.dart';
import 'package:app_instagram_clone/features/auth/data/DTOs/responses/auth_token_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_datasource_remote.g.dart';

@lazySingleton
@RestApi()
abstract class AuthDatasourceRemote {
  @factoryMethod
  factory AuthDatasourceRemote(Dio dio) = _AuthDatasourceRemote;

  @POST('/auth/sign-in/userpass')
  Future<SuccessfulResponseWrapper<AuthTokenResponse>> signInWithUserpass({
    @Body() required SignInWithUserpassRequest body, 
    @Extras() Map<String, dynamic>? extras,
  });
}
