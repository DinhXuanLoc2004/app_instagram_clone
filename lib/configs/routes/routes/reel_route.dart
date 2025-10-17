import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/features/reel/presentation/page/reel_page.dart';
import 'package:go_router/go_router.dart';

abstract final class ReelRoute {
  static final RouteBase route = GoRoute(
    path: RouterEnum.reel.path,
    name: RouterEnum.reel.name,
    builder: (context, state) => const ReelPage(),
  );
}
