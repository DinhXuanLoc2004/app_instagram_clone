import 'package:json_annotation/json_annotation.dart';

part 'exception_wrapper.g.dart';

@JsonSerializable(createToJson: false)
class ExceptionWrapper {
  final int status;
  final String message;
  final String error;

  const ExceptionWrapper({
    required this.status,
    required this.message,
    required this.error
  });

  factory ExceptionWrapper.fromJson(Map<String, dynamic> json) => _$ExceptionWrapperFromJson(json);
}