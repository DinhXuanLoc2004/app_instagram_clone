import 'package:app_instagram_clone/cores/helpers/result/result.dart';
import 'package:app_instagram_clone/features/auth/domain/usecases/logout_usecase.dart';
import 'package:app_instagram_clone/features/profile/presentation/blocs/logout/logout_event.dart';
import 'package:app_instagram_clone/features/profile/presentation/blocs/logout/logout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUsecase _logoutUsecase;

  LogoutBloc({required LogoutUsecase logoutUsecase})
    : _logoutUsecase = logoutUsecase,
      super(const LogoutState.init()) {
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<LogoutState> emit) async {
    emit(const LogoutState.loading());
    final result = await _logoutUsecase.executed();

    result.when(
      success: (data) => emit(const LogoutState.success()),
      exception: (error) =>
          emit(LogoutState.failure(error.failureType, error.message)),
    );
  }
}
