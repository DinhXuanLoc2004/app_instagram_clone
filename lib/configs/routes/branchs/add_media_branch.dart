import 'package:app_instagram_clone/configs/routes/routes/add_media_route.dart';
import 'package:go_router/go_router.dart';

abstract final class AddMediaBranch {
  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [AddMediaRoute.route],
  );
}
