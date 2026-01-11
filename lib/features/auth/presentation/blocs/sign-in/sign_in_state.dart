
import 'package:app_instagram_clone/cores/error/failure_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState{
  const factory SignInState.inittial() = _Initial;

  const factory SignInState.userpassLoading() = _UserpassLoading;
  const factory SignInState.facebookLoading() = _FacebookLoading;

  const factory SignInState.success() = _Success;

  const factory SignInState.userpassFailure(FailureType failureType, String message) = _UserpassFailure;
  const factory SignInState.facebookFailure(FailureType failureType, String message) = _FacebookFailure;
}
