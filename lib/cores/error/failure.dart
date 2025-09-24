import 'package:app_instagram_clone/configs/logger/log.dart';
import 'package:app_instagram_clone/configs/network/responses/exception/exception_response.dart';
import 'package:app_instagram_clone/cores/error/custom_exceptions.dart';
import 'package:app_instagram_clone/cores/error/failure_type.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure({
    required FailureType failureType,
    required String message,
    String? code,
    StackTrace? stackTrace,
  }) = _Failure;

  const Failure._();

  factory Failure.mapExceptionToFailure(Object e) {
    if (e is DioException) {
      final ({String message, String? code})? error = _parseError(e.response);

      return switch (e.type) {
        DioExceptionType.connectionTimeout => Failure(
          failureType: FailureType.timeout,
          message:
              error?.message ??
              'Unable to connect.'
                  'Please check your internet connection and try again.',
          code: error?.code,
          stackTrace: e.stackTrace,
        ),
        DioExceptionType.receiveTimeout ||
        DioExceptionType.sendTimeout => Failure(
          failureType: FailureType.timeout,
          message:
              error?.message ??
              'The request took too long to complete.'
                  'Please try again or check your network connection.',
          code: error?.code,
          stackTrace: e.stackTrace,
        ),
        DioExceptionType.badResponse => Failure(
          failureType: FailureType.badResponse,
          message: error?.message ?? e.toString(),
          code: error?.code,
          stackTrace: e.stackTrace,
        ),
        DioExceptionType.badCertificate => Failure(
          failureType: FailureType.badCartificate,
          message: error?.message ?? e.toString(),
          code: error?.code,
          stackTrace: e.stackTrace,
        ),
        DioExceptionType.connectionError => Failure(
          failureType: FailureType.network,
          message:
              error?.message ??
              'Unable to connect to the server.'
                  'Please check your internet connection or try again later.',
          code: error?.code,
          stackTrace: e.stackTrace,
        ),
        _ => Failure(
          failureType: FailureType.unknown,
          message: error?.message ?? 'Something went wrong.',
          code: error?.code,
          stackTrace: e.stackTrace,
        ),
      };
    }

    if (e is CustomExceptions) {
      return switch (e) {
        ParsingException() => Failure(
          failureType: FailureType.parsing,
          message: e.message,
          stackTrace: e.stackTrace,
        ),
        ValidationException() => Failure(
          failureType: FailureType.validation,
          message: e.message,
          stackTrace: e.stackTrace,
        ),
        IllegalOperationException() => Failure(
          failureType: FailureType.illegalOperation,
          message: e.message,
          stackTrace: e.stackTrace,
        ),
        NotFoundException() => Failure(
          failureType: FailureType.notFound,
          message: e.message,
          stackTrace: e.stackTrace,
        ),
        UnauthorizedException() => Failure(
          failureType: FailureType.unauthorized,
          message: e.message,
          stackTrace: e.stackTrace,
        ),
        _ => Failure(
          failureType: FailureType.unknown,
          message: e.toString(),
          stackTrace: e.stackTrace,
        ),
      };
    }

    if (e is Error) {
      return switch (e) {
        TypeError() => Failure(
          failureType: FailureType.typeError,
          message: 'Type mismatch: ${e.toString()}',
          stackTrace: e.stackTrace,
        ),
        _ => Failure(
          failureType: FailureType.unknown,
          message: e.toString(),
          stackTrace: e.stackTrace,
        ),
      };
    }

    return Failure(failureType: FailureType.unknown, message: e.toString());
  }

  static ({String? code, String message})? _parseError(Response? response) {
    if (response == null) return null;

    try {
      if (response.data is Map<String, dynamic>) {
        final ExceptionResponse exceptionResponse = ExceptionResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
        return (
          code: exceptionResponse.status.toString(),
          message: exceptionResponse.message,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return null;
    }

    return null;
  }
}
