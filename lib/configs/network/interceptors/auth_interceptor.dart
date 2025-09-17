import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AuthInterceptor extends QueuedInterceptorsWrapper {
  final String? _accessToken = null;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['content-type'] = 'application/json';
    options.headers['Authorization'] = 'Bearer $_accessToken'; 
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
