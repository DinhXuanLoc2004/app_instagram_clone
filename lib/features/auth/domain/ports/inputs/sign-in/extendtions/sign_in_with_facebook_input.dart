import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/abstractions/abs_sign_in_input.dart';

class SignInWithFacebookInput extends AbsSignInInput {
  final String _oidcID;
  final String _rawNonce;

  const SignInWithFacebookInput({
    required String oidcID,
    required String rawNonce
  }) : _oidcID = oidcID, _rawNonce = rawNonce;

  String get oidcID => _oidcID;
  String get rawNonce => _rawNonce;
}