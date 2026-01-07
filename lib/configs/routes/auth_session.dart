
import 'package:app_instagram_clone/cores/storage/abstraction/abs_auth_token_storage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
final class AuthSession extends ChangeNotifier{
  final AbsAuthTokenStorage _tokenStorage;

  AuthSession({
    required AbsAuthTokenStorage tokenStorage
  }) : _tokenStorage = tokenStorage;

  bool _isAuthorized = false;

  bool get isAuthorized => _isAuthorized; 

  Future<void> init() async{
    final token = await _tokenStorage.readToken();
    _isAuthorized = token != null;
    notifyListeners();
  }

  Future<void> onAuthorized() async{
    _isAuthorized = true;
    notifyListeners();
  }

  Future<void> onLogout() async {
    _isAuthorized = false;
    notifyListeners();
  }
}