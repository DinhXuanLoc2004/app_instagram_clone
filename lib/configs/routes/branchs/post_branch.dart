import 'package:app_instagram_clone/configs/routes/routes/post_route.dart';
import 'package:go_router/go_router.dart';

abstract final class PostBranchs {
  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [PostRoute.route],
  );
}
