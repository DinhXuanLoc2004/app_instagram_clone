// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenModel _$AuthTokenModelFromJson(
  Map<String, dynamic> json,
) => AuthTokenModel(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  accessTokenExpireAt: json['accessTokenExpireAt'] as String,
  accessTokenExpireAtEpoch: (json['accessTokenExpireAtEpoch'] as num).toInt(),
  refreshTokenExpireAt: json['refreshTokenExpireAt'] as String,
  refreshTokenExpireAtEpoch: (json['refreshTokenExpireAtEpoch'] as num).toInt(),
);

Map<String, dynamic> _$AuthTokenModelToJson(AuthTokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'accessTokenExpireAt': instance.accessTokenExpireAt,
      'accessTokenExpireAtEpoch': instance.accessTokenExpireAtEpoch,
      'refreshTokenExpireAt': instance.refreshTokenExpireAt,
      'refreshTokenExpireAtEpoch': instance.refreshTokenExpireAtEpoch,
    };
