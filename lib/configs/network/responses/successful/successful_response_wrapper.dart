import 'package:json_annotation/json_annotation.dart';

part 'successful_response_wrapper.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class SuccessfulResponseWrapper<T> {
  final int status;
  final String message;
  final T metadata;

  const SuccessfulResponseWrapper({
    required this.status,
    required this.message,
    required this.metadata,
  });

  factory SuccessfulResponseWrapper.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$SuccessfulResponseWrapperFromJson(json, fromJsonT);
}
