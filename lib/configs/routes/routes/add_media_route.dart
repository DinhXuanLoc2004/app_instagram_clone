import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/features/add_media/presentation/page/add_media_page.dart';
import 'package:go_router/go_router.dart';

abstract final class AddMediaRoute {
  static final RouteBase route = GoRoute(
    path: RouterEnum.addMedia.path,
    name: RouterEnum.addMedia.name,
    builder: (context, state) => const AddMediaPage(),
  );
}
