sealed class SignInEvent {}

final class SignInWithUserpassEvent extends SignInEvent{
  final String email;
  final String password;

  SignInWithUserpassEvent({required this.email, required this.password});
}
