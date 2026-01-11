sealed class SignInEvent {}

final class SignInWithUserpassEvent extends SignInEvent{
  final String email;
  final String password;

  SignInWithUserpassEvent({required this.email, required this.password});
}

final class SignInWithFBEvent extends SignInEvent{}

final class ClearUnauthorizedEvent extends SignInEvent{}
