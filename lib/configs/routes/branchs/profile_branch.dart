import 'package:app_instagram_clone/configs/routes/routes/profile_route.dart';
import 'package:go_router/go_router.dart';

abstract final class ProfileBranch {
  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [ProfileRoute.route],
  );
}
