import 'package:app_instagram_clone/cores/storage/abstraction/abs_auth_token_storage.dart';
import 'package:app_instagram_clone/cores/storage/model/auth_token_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends QueuedInterceptorsWrapper {
  final AbsAuthTokenStorage _authTokenStorage;

  AuthInterceptor(AbsAuthTokenStorage authTokenStorage)
    : _authTokenStorage = authTokenStorage;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['content-type'] = 'application/json';

    if (options.extra['skipAuth'] == true) {
      handler.next(options);
      return;
    }

    final AuthTokenModel? authTokenModel = await _authTokenStorage.readToken();

    if (authTokenModel == null) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'Token not found',
          type: DioExceptionType.cancel,
        ),
      );
      return;
    }

    options.headers['Authorization'] = 'Bearer ${authTokenModel.accessToken}';
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    handler.next(err);
  }
}
