import 'package:app_instagram_clone/configs/routes/routes/feed_route.dart';
import 'package:go_router/go_router.dart';

abstract final class FeedBranch {
  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [FeedRoute.route],
  );
}
