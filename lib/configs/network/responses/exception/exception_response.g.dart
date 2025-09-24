// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExceptionResponse _$ExceptionResponseFromJson(Map<String, dynamic> json) =>
    ExceptionResponse(
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      error: json['error'] as String,
    );
