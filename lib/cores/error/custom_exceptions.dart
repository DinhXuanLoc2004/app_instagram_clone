
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_exceptions.freezed.dart';

@freezed
sealed class CustomExceptions with _$CustomExceptions {
  const factory CustomExceptions.parsing({
    required String message,
    String? field,
    Object? originalError,
    StackTrace? stackTrace
  }) = ParsingException;

  const factory CustomExceptions.validation({
    required String message,
    required String field,
    Map<String, dynamic>? errors,
    StackTrace? stackTrace
  }) = ValidationException;

  const factory CustomExceptions.illegalOperation({
    required String message,
    String? operation,
    String? reason,
    StackTrace? stackTrace
  }) = IllegalOperationException;

  const factory CustomExceptions.notFound({
    required String message,
    String? resource,
    String? identitier,
    StackTrace? stackTrace
  }) = NotFoundException;

  const factory CustomExceptions.unauthorized({
    required String message,
    String? requiredPermission,
    StackTrace? stackTrace
  }) = UnauthorizedException;

  const factory CustomExceptions.unknown({
    required String message,
    Object? originalError,
    StackTrace? stackTrace,
  }) = UnknownException;
}