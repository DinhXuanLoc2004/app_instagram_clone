import 'package:app_instagram_clone/cores/helpers/result/result.dart';
import 'package:app_instagram_clone/features/auth/domain/ports/inputs/sign_up_input.dart';
import 'package:app_instagram_clone/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-up/sign_up_event.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-up/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUsecase _signUpUsecase;

  SignUpBloc(this._signUpUsecase) : super(const SignUpState.init()) {
    on<CreateAccountEvent>(_onSignUp);
    on<ClearBadRequestEvent>((event, emit) => emit(const SignUpState.init()),);
  }

  Future<void> _onSignUp(CreateAccountEvent event, Emitter<SignUpState> emit) async {
    emit(const SignUpState.loading());

    final input = SignUpInput(email: event.email, password: event.password);

    final result = await _signUpUsecase.executed(input);

    result.when(
      success: (data) => emit(const SignUpState.success()),
      exception: (error) =>
          emit(SignUpState.failure(error.failureType, error.message)),
    );
  }
}
