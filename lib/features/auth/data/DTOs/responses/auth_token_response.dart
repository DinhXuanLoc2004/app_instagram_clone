import 'package:json_annotation/json_annotation.dart';

part 'auth_token_response.g.dart';

@JsonSerializable(createToJson: false)
class AuthTokenResponse {
  final String accessToken;
  final String refreshToken;

  const AuthTokenResponse({required this.accessToken, required this.refreshToken});

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenResponseFromJson(json);
}
