import 'package:app_instagram_clone/configs/routes/routes/reel_route.dart';
import 'package:go_router/go_router.dart';

abstract final class ReelBranch {
  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [ReelRoute.route],
  );
}
