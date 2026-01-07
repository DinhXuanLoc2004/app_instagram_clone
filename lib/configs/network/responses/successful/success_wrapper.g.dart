// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessWrapper<T> _$SuccessWrapperFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => SuccessWrapper<T>(
  status: (json['status'] as num).toInt(),
  message: json['message'] as String,
  metadata: fromJsonT(json['metadata']),
);
