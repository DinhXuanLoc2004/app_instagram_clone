import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/features/auth/presentation/pages/sign_up_page.dart';
import 'package:go_router/go_router.dart';

abstract class SignUpRoute {
  static final RouteBase route = GoRoute(
    name: RouterEnum.signUp.name,
    path: RouterEnum.signUp.path,
    builder: (context, state) => const SignUpPage(),
  );
}
