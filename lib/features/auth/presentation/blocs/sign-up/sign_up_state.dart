
import 'package:app_instagram_clone/cores/error/failure_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState{
  const factory SignUpState.init() = _Init;
  const factory SignUpState.loading() = _Loading;
  const factory SignUpState.success() = _Success;
  const factory SignUpState.failure(FailureType failureType, String message) = _Failure;
}