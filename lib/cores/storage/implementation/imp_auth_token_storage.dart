import 'dart:convert';

import 'package:app_instagram_clone/configs/logger/log.dart';
import 'package:app_instagram_clone/cores/storage/abstraction/abs_auth_token_storage.dart';
import 'package:app_instagram_clone/cores/storage/model/auth_token_model.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@LazySingleton(as: AbsAuthTokenStorage)
class ImpAuthTokenStorage implements AbsAuthTokenStorage {
  final FlutterSecureStorage _flutterSecureStorage;
  static const String KEY_AUTH_TOKEN = 'auth_token';

  ImpAuthTokenStorage() : _flutterSecureStorage = const FlutterSecureStorage();

  @override
  Future<void> deleteToken() async {
    await _flutterSecureStorage.delete(key: KEY_AUTH_TOKEN);
  }

  @override
  Future<AuthTokenModel?> readToken() async {
    final String? tokenString = await _flutterSecureStorage.read(
      key: KEY_AUTH_TOKEN,
    );

    if (tokenString == null || tokenString.isEmpty) {
      return null;
    }

    try {
      final decoded = jsonDecode(tokenString);

      if (decoded is! Map<String, dynamic>) {
        return null;
      }

      // Validate bắt buộc
      final requiredKeys = [
        'accessToken',
        'refreshToken',
        'accessTokenExpireAt',
        'accessTokenExpireAtEpoch',
        'refreshTokenExpireAt',
        'refreshTokenExpireAtEpoch',
      ];

      for (final key in requiredKeys) {
        if (!decoded.containsKey(key) || decoded[key] == null) {
          return null;
        }
      }

      return AuthTokenModel.fromJson(decoded);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveToken(AuthTokenModel token) async {
    Log.debug('save token');
    final Map<String, dynamic> tokenToJson = token.toJson();
    final String jsonTokenEncode = jsonEncode(tokenToJson);
    await _flutterSecureStorage.write(
      key: KEY_AUTH_TOKEN,
      value: jsonTokenEncode,
    );
  }
}
