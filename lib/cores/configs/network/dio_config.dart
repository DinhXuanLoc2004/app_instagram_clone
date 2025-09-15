import 'package:app_instagram_clone/cores/configs/network/interceptors/auth_interceptor.dart';
import 'package:app_instagram_clone/cores/configs/network/interceptors/logger_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DioConfig {
  final AuthInterceptor _authInterceptor;
  final LoggerInterceptor _loggerInterceptor;
  final Dio _dio = Dio();

  DioConfig({
    required AuthInterceptor authInterceptor,
    required LoggerInterceptor loggerInterceptor,
  }) : _authInterceptor = authInterceptor,
       _loggerInterceptor = loggerInterceptor;

  init() {
    _dio.interceptors.addAll([_authInterceptor, _loggerInterceptor]);
    return _dio;
  }
}
