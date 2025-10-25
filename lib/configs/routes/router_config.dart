import 'package:app_instagram_clone/configs/routes/branchs/add_media_branch.dart';
import 'package:app_instagram_clone/configs/routes/branchs/feed_branch.dart';
import 'package:app_instagram_clone/configs/routes/branchs/profile_branch.dart';
import 'package:app_instagram_clone/configs/routes/branchs/reel_branch.dart';
import 'package:app_instagram_clone/configs/routes/branchs/search_branch.dart';
import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/configs/routes/routes/sign_in_route.dart';
import 'package:app_instagram_clone/cores/widgets/bars/scaffold_with_nav_bar.dart';
import 'package:go_router/go_router.dart';

abstract final class RouterConfig {
  static final List<StatefulShellBranch> _listBranchs = [
    FeedBranch.branch,
    SearchBranchs.branch,
    AddMediaBranch.branch,
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
  ];

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RouterEnum.feed.path,
    routes: _routes,
  );
}
