
import 'package:app_instagram_clone/cores/error/failure_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState{
  const factory SignInState.inittial() = _Initial;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.success() = _Success;
  const factory SignInState.failure(FailureType failureType, String message) = _Failure;
}
