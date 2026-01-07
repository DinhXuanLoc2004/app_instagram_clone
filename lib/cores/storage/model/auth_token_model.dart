import 'package:json_annotation/json_annotation.dart';

part 'auth_token_model.g.dart';

@JsonSerializable()
class AuthTokenModel {
  final String accessToken;
  final String refreshToken;
  final String accessTokenExpireAt;
  final int accessTokenExpireAtEpoch;
  final String refreshTokenExpireAt;
  final int refreshTokenExpireAtEpoch;

  const AuthTokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpireAt,
    required this.accessTokenExpireAtEpoch,
    required this.refreshTokenExpireAt,
    required this.refreshTokenExpireAtEpoch
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenModelToJson(this);
}
