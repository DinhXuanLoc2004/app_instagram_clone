import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/features/feed/presentation/pages/feed_page.dart';
import 'package:go_router/go_router.dart';

abstract final class FeedRoute {
  static final RouteBase route = 
    GoRoute(
      name: RouterEnum.feed.name,
      path: RouterEnum.feed.path,
      builder: (context, state) => const FeedPage(),
    );
}
