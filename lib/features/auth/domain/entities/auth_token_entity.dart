class AuthTokenEntity {
  final String _accessToken;
  final String _refreshToken;

  const AuthTokenEntity({
    required String accessToken,
    required String refreshToken,
  }) : _accessToken = accessToken,
       _refreshToken = refreshToken;

  String get accessToken => _accessToken;

  String get refreshToken => _refreshToken;
}
