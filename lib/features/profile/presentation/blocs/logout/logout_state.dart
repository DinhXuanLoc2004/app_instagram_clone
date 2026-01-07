
import 'package:app_instagram_clone/cores/error/failure_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_state.freezed.dart';

@freezed
class LogoutState with _$LogoutState{
  const factory LogoutState.init() = _Init;
  const factory LogoutState.loading() = _Loading;
  const factory LogoutState.success() = _Success;
  const factory LogoutState.failure(FailureType failureType, String message) = _Failrue;
}