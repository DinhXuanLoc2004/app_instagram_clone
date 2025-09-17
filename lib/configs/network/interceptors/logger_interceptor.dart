import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoggerInterceptor extends LogInterceptor {
  LoggerInterceptor() : super(requestBody: true, responseBody: true);
}
