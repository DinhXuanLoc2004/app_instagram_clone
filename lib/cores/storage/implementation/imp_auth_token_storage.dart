import 'dart:convert';

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
  Future<void> deleteToken() async{
    await _flutterSecureStorage.delete(key: KEY_AUTH_TOKEN);
  }

  @override
  Future<AuthTokenModel?> readToken() async {
    final String? tokenString = await _flutterSecureStorage.read(
      key: KEY_AUTH_TOKEN,
    );
    if (tokenString == null) return null;
    final dynamic tokenDecode = jsonDecode(tokenString);
    final AuthTokenModel tokenFromJson = AuthTokenModel.fromJson(tokenDecode);
    return tokenFromJson;
  }

  @override
  Future<void> saveToken(AuthTokenModel token) async {
    final Map<String, dynamic> tokenToJson = token.toJson();
    final String jsonTokenEncode = jsonEncode(tokenToJson);
    await _flutterSecureStorage.write(
      key: KEY_AUTH_TOKEN,
      value: jsonTokenEncode,
    );
  }
}
