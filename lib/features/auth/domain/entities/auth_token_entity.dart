class AuthTokenEntity {
  final String _accessToken;
  final String _refreshToken;
  final String _accessTokenExpireAt;
  final int _accessTokenExpireAtEpoch;
  final String _refreshTokenExpireAt;
  final int _refreshTokenExpireAtEpoch;

  const AuthTokenEntity({
    required String accessToken,
    required String refreshToken,
    required String accessTokenExpireAt,
    required int accessTokenExpireAtEpoch,
    required String refreshTokenExpireAt,
    required int refreshTokenExpireAtEpoch
  }) : _accessToken = accessToken,
       _refreshToken = refreshToken,
       _accessTokenExpireAt = accessTokenExpireAt,
       _accessTokenExpireAtEpoch = accessTokenExpireAtEpoch,
       _refreshTokenExpireAt = refreshTokenExpireAt,
       _refreshTokenExpireAtEpoch = refreshTokenExpireAtEpoch;

  String get accessToken => _accessToken;

  String get refreshToken => _refreshToken;

  String get accessTokenExpireAt => _accessTokenExpireAt;
  int get accessTokenExpireAtEpoch => _accessTokenExpireAtEpoch;

  String get refreshTokenExpireAt => _refreshTokenExpireAt;
  int get refreshTokenExpireAtEpoch => _refreshTokenExpireAtEpoch;
}
