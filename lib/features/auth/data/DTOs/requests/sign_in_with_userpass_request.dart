import 'package:json_annotation/json_annotation.dart';

part 'sign_in_with_userpass_request.g.dart';

@JsonSerializable(createFactory: false)
class SignInWithUserpassRequest {
  final String email;
  final String password;

  const SignInWithUserpassRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$SignInWithUserpassRequestToJson(this);
}
