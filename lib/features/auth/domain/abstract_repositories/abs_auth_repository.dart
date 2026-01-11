import 'package:app_instagram_clone/cores/error/failure.dart';
import 'package:app_instagram_clone/cores/helpers/result/result.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/extendtions/sign_in_with_facebook_input.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/extendtions/sign_in_with_userpass_input.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign_up_input.dart';

abstract class AbsAuthRepository {
  Future<Result<AuthTokenEntity, Failure>> signInWithUserpass(SignInWithUserpassInput input);
  Future<Result<AuthTokenEntity, Failure>> signInWithFacebook(SignInWithFacebookInput input);
  Future<Result<AuthTokenEntity, Failure>> signUp(SignUpInput input);
  Future<Result<void, Failure>> logout(String refreshToken);
}