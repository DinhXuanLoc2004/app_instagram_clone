import 'package:json_annotation/json_annotation.dart';

part 'exception_response.g.dart';

@JsonSerializable(createToJson: false)
class ExceptionResponse {
  final int status;
  final String message;
  final String error;

  const ExceptionResponse({
    required this.status,
    required this.message,
    required this.error
  });

  factory ExceptionResponse.fromJson(Map<String, dynamic> json) => _$ExceptionResponseFromJson(json);
}