import 'package:app_instagram_clone/configs/logger/log.dart';
import 'package:app_instagram_clone/features/auth/domain/abstract_services/abs_facebook_service.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/extendtions/sign_in_with_facebook_input.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AbsFacebookService)
final class ImpFacebookService implements AbsFacebookService {
  @override
  Future<SignInWithFacebookInput?> getAuthenticationToken() async {
    const FB_LOGIN_CHANNEL = 'FB_LOGIN_CHANNEL';
    const FB_LOGIN = 'FB_LOGIN';
    const loginFBChannel = MethodChannel(FB_LOGIN_CHANNEL);
    final result = await loginFBChannel.invokeMethod(FB_LOGIN);
    if (result == null) {
      return null;
    }
    final authToken = result['authToken'];
    Log.info('authToken:: $authToken');
    final nonce = result['nonce'];
    Log.info('nonce:: $nonce');
    return SignInWithFacebookInput(oidcID: authToken, rawNonce: nonce);
  }
}
