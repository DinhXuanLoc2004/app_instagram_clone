import 'package:app_instagram_clone/configs/dependency_injection/injection.dart';
import 'package:app_instagram_clone/configs/logger/log.dart';
import 'package:app_instagram_clone/configs/routes/auth_session.dart';
import 'package:app_instagram_clone/configs/routes/branchs/feed_branch.dart';
import 'package:app_instagram_clone/configs/routes/branchs/profile_branch.dart';
import 'package:app_instagram_clone/configs/routes/branchs/reel_branch.dart';
import 'package:app_instagram_clone/configs/routes/branchs/search_branch.dart';
import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/configs/routes/router_names.dart';
import 'package:app_instagram_clone/configs/routes/routes/sign_in_route.dart';
import 'package:app_instagram_clone/configs/routes/bars/scaffold_with_nav_bar.dart';
import 'package:app_instagram_clone/configs/routes/routes/sign_up_route.dart';
import 'package:go_router/go_router.dart';

abstract final class RouterConfig {
  static final authSession = getIt<AuthSession>();

  static final List<StatefulShellBranch> _listBranchs = [
    FeedBranch.branch,
    SearchBranchs.branch,
    ReelBranch.branch,
    ProfileBranch.branch,
  ];

  static final StatefulShellRoute _statefulShellRoute =
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: _listBranchs,
      );

  static final List<RouteBase> _routes = <RouteBase>[
    _statefulShellRoute,
    SignInRoute.route,
    SignUpRoute.route,
  ];

  static final publicRoutes = [
    RouterEnum.signIn.path,
    RouterEnum.signUp.path
  ];

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: authSession,
    redirect: (context, state) {
      final isAuth = authSession.isAuthorized;
      final currentRoute = state.matchedLocation;
      Log.debug('currentRoute:: $currentRoute');

      if (isAuth && publicRoutes.contains(currentRoute)) {
        Log.debug('navigate:: feed');
        return RouterEnum.feed.path;
      }
      if (!isAuth && !publicRoutes.contains(currentRoute)) {
        Log.debug('navigate:: siginIn');
        return RouterEnum.signIn.path;
      }
      return null;
    },
    // initialLocation: RouterEnum.signIn.path,
    routes: _routes,
  );
}
