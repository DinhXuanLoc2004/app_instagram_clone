import 'package:json_annotation/json_annotation.dart';

part 'jwt_response.g.dart';

@JsonSerializable(createToJson: false)
class JwtResponse {
  final String accessToken;
  final String refreshToken;

  const JwtResponse({required this.accessToken, required this.refreshToken});

  factory JwtResponse.fromJson(Map<String, dynamic> json) =>
      _$JwtResponseFromJson(json);
}
