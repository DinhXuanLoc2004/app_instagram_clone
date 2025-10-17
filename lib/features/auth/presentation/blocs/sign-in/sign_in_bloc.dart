import 'dart:async';

import 'package:app_instagram_clone/cores/error/failure.dart';
import 'package:app_instagram_clone/cores/helpers/result/result.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/extendtions/sign_in_with_userpass_input.dart';
import 'package:app_instagram_clone/features/auth/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:app_instagram_clone/features/auth/domain/usecases/sign_in/strategy/implementations/sign_in_with_userpass_strategy.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-in/sign_in_event.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-in/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInWithUserpassStrategy _signInWithUserpassStrategy;

  SignInBloc(this._signInWithUserpassStrategy)
    : super(const SignInState.inittial()) {
    on<SignInWithUserpassEvent>(_onSignInWithUserpass);
  }

  Future<void> _onSignInWithUserpass(
    SignInWithUserpassEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.loading());
    final SignInUsecase signInUsecase = SignInUsecase(
      absSignInStrategy: _signInWithUserpassStrategy,
    );
    final SignInWithUserpassInput input = SignInWithUserpassInput(
      email: event.email,
      password: event.password,
    );
    final Result<AuthTokenEntity, Failure> result = await signInUsecase
        .executed(input);
    result.when(
      success: (data) => emit(const SignInState.success()),
      exception: (error) =>
          emit(SignInState.failure(error.failureType, error.message)),
    );
  }
}
