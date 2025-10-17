import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/features/post/presentation/pages/post_page.dart';
import 'package:go_router/go_router.dart';

abstract final class PostRoute {
  static final RouteBase route = 
    GoRoute(
      name: RouterEnum.post.name,
      path: RouterEnum.post.path,
      builder: (context, state) => const PostPage(),
    );
}
