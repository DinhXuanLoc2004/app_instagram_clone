import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/features/auth/presentation/pages/sign_in_page.dart';
import 'package:go_router/go_router.dart';

abstract final class SignInRoute {
  static final RouteBase route = GoRoute(
    name: RouterEnum.signIn.name,
    path: RouterEnum.signIn.path,
    builder: (context, state) => const SignInPage(),
  );
}
