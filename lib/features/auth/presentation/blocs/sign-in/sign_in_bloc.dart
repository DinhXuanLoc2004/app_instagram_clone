import 'dart:async';

import 'package:app_instagram_clone/cores/error/failure.dart';
import 'package:app_instagram_clone/cores/helpers/result/result.dart';
import 'package:app_instagram_clone/features/auth/domain/entities/auth_token_entity.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign-in/extendtions/sign_in_with_userpass_input.dart';
import 'package:app_instagram_clone/features/auth/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:app_instagram_clone/features/auth/domain/usecases/sign_in/strategy/implementations/sign_in_with_fb_strategy.dart';
import 'package:app_instagram_clone/features/auth/domain/usecases/sign_in/strategy/implementations/sign_in_with_userpass_strategy.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-in/sign_in_event.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-in/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInWithUserpassStrategy _signInWithUserpassStrategy;
  final SignInWithFBStrategy _signInWithFBStrategy;

  SignInBloc(this._signInWithUserpassStrategy, this._signInWithFBStrategy)
    : super(const SignInState.inittial()) {
    on<SignInWithUserpassEvent>(_onSignInWithUserpass);
    on<SignInWithFBEvent>(_onSignInWithFB);
    on<ClearUnauthorizedEvent>(
      (event, emit) => emit(const SignInState.inittial()),
    );
  }

  Future<void> _onSignInWithUserpass(
    SignInWithUserpassEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.userpassLoading());
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
          emit(SignInState.userpassFailure(error.failureType, error.message)),
    );
  }

  Future<void> _onSignInWithFB(
    SignInWithFBEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(const SignInState.facebookLoading());
    
    final usecase = SignInUsecase(absSignInStrategy: _signInWithFBStrategy);
    final result = await usecase.executed();

    result.when(
      success: (data) => emit(const SignInState.success()),
      exception: (error) =>
          emit(SignInState.facebookFailure(error.failureType, error.message)),
    );
  }
}
