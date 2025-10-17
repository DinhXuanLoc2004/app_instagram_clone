import 'package:app_instagram_clone/configs/logger/log.dart';
import 'package:app_instagram_clone/cores/error/failure.dart';
import 'package:app_instagram_clone/cores/helpers/result/result.dart';

abstract base class HandleResult<T> {
  /// Executes an asynchronous operation and wraps the result in a [Result]
  /// type.
  ///
  /// This method provides a safe way to handle asynchronous operations by
  /// catching any exceptions that occur during execution and converting them to
  /// [Failure] objects wrapped in an [Error] result.
  ///
  /// Parameters:
  /// - [operation]: A function that returns a [Future<T>] to be executed
  ///
  /// Returns:
  /// - [Success<T>] if the operation completes successfully
  /// - [Error<Failure>] if an exception occurs during execution
  ///
  /// Example:
  /// ```dart
  /// final result = await asyncGuard(() async {
  ///   return await apiService.fetchData();
  /// });
  ///
  /// result.when(
  ///   success: (data) => print('Data: $data'),
  ///   error: (failure) => print('Error: ${failure.message}'),
  /// );
  /// ```
  static Future<Result<T, Failure>> asyncGuard<T>(
    Future<T> Function() operation,
  ) async {
    try {
      final T data = await operation();
      return Success(data);
    } on Exception catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return Error(Failure.mapExceptionToFailure(e));
    }
  }

  /// Executes a synchronous operation and wraps the result in a [Result] type.
  ///
  /// This method provides a safe way to handle synchronous operations by
  /// catching any exceptions that occur during execution and converting them to
  /// [Failure] objects wrapped in an [Error] result.
  ///
  /// Parameters:
  /// - [operation]: A function that returns a value of type [T] to be executed
  ///
  /// Returns:
  /// - [Success<T>] if the operation completes successfully
  /// - [Error<Failure>] if an exception occurs during execution
  ///
  /// Example:
  /// ```dart
  /// final result = guard(() {
  ///   return jsonDecode(jsonString);
  /// });
  ///
  /// result.when(
  ///   success: (data) => print('Parsed data: $data'),
  ///   error: (failure) => print('Parsing error: ${failure.message}'),
  /// );
  /// ```
  static Result<T, Failure> guard<T>(T Function() operation) {
    try {
      final T data = operation();
      return Success(data);
    } on Exception catch (e) {
      return Error(Failure.mapExceptionToFailure(e));
    }
  }
}
