import 'package:app_instagram_clone/configs/dependency_injection/injection.dart';
import 'package:app_instagram_clone/configs/routes/auth_session.dart';
import 'package:app_instagram_clone/cores/widgets/buttons/button_base.dart';
import 'package:app_instagram_clone/features/profile/presentation/blocs/logout/logout_bloc.dart';
import 'package:app_instagram_clone/features/profile/presentation/blocs/logout/logout_event.dart';
import 'package:app_instagram_clone/features/profile/presentation/blocs/logout/logout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthSession _authSession = getIt<AuthSession>();

  void _logout(BuildContext context) {
    context.read<LogoutBloc>().add(LogoutEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<LogoutBloc, LogoutState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
    
            return ButtonBase(onPressed: () => _logout(context), isLoading: isLoading, child: const Text('Logout'),);
          },
          listener: (context, state) {
            state.whenOrNull(success: _authSession.onLogout);
          },
        ),
      ),
    );
  }
}
