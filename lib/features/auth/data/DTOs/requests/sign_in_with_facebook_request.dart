
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_with_facebook_request.g.dart';

@JsonSerializable(createFactory: false)
class SignInWithFacebookRequest {
  final String oidcID;
  final String rawNonce;

  const SignInWithFacebookRequest({required this.oidcID, required this.rawNonce});

  Map<String, dynamic> toJson() => _$SignInWithFacebookRequestToJson(this);
}