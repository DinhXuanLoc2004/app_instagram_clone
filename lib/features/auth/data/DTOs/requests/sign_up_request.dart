
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable(createFactory: false)
class SignUpRequest {
  final String email;
  final String password;

  const SignUpRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}