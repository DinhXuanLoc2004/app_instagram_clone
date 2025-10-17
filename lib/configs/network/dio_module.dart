import 'package:app_instagram_clone/configs/network/interceptors/auth_interceptor.dart';
import 'package:app_instagram_clone/configs/network/interceptors/logger_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio(
    AuthInterceptor authInterceptor,
    LoggerInterceptor loggerInterceptor,
  ) {
    const String SCHEME = 'http';
    // const String HOST = 'localhost';
    const String HOST = '192.168.1.7';
    const int PORT = 8888;
    const String BASE_PATH = 'api';
    const int VERSION = 1;

    const String BASE_URL = '$SCHEME://$HOST:$PORT/$BASE_PATH/v$VERSION';
    const Duration CONNECT_TIMEOUT = Duration(seconds: 10);
    const Duration RECEIVE_TIMEOUT = Duration(seconds: 10);

    final BaseOptions baseOptions = BaseOptions(
      baseUrl: BASE_URL, // baseUrl global
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
    );

    final dio = Dio(baseOptions);

    dio.interceptors.addAll([authInterceptor, loggerInterceptor]);

    return dio;
  }
}
