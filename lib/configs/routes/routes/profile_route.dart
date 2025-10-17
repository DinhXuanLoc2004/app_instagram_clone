import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/features/profile/presentation/page/profile_page.dart';
import 'package:go_router/go_router.dart';

abstract final class ProfileRoute {
  static final RouteBase route = GoRoute(
    path: RouterEnum.profile.path,
    name: RouterEnum.profile.name,
    builder: (context, state) => const ProfilePage(),
  );
}
