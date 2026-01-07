import 'package:json_annotation/json_annotation.dart';

part 'success_wrapper.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class SuccessWrapper<T> {
  final int status;
  final String message;
  final T metadata;

  const SuccessWrapper({
    required this.status,
    required this.message,
    required this.metadata,
  });

  factory SuccessWrapper.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$SuccessWrapperFromJson(json, fromJsonT);
}
