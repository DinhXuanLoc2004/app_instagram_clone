// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenResponse _$AuthTokenResponseFromJson(
  Map<String, dynamic> json,
) => AuthTokenResponse(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  accessTokenExpireAt: json['accessTokenExpireAt'] as String,
  accessTokenExpireAtEpoch: (json['accessTokenExpireAtEpoch'] as num).toInt(),
  refreshTokenExpireAt: json['refreshTokenExpireAt'] as String,
  refreshTokenExpireAtEpoch: (json['refreshTokenExpireAtEpoch'] as num).toInt(),
);
