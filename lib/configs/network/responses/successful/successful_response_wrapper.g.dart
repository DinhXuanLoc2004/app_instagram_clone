// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'successful_response_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessfulResponseWrapper<T> _$SuccessfulResponseWrapperFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => SuccessfulResponseWrapper<T>(
  status: (json['status'] as num).toInt(),
  message: json['message'] as String,
  metadata: fromJsonT(json['metadata']),
);
