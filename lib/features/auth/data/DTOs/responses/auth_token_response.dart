import 'package:json_annotation/json_annotation.dart';

part 'auth_token_response.g.dart';

@JsonSerializable(createToJson: false)
class AuthTokenResponse {
  final String accessToken;
  final String refreshToken;
  final String accessTokenExpireAt;
  final int accessTokenExpireAtEpoch;
  final String refreshTokenExpireAt;
  final int refreshTokenExpireAtEpoch;

  const AuthTokenResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpireAt,
    required this.accessTokenExpireAtEpoch,
    required this.refreshTokenExpireAt,
    required this.refreshTokenExpireAtEpoch
  });

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenResponseFromJson(json);
}
