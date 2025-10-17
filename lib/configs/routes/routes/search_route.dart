import 'package:app_instagram_clone/configs/routes/router_enum.dart';
import 'package:app_instagram_clone/features/search/presentation/page/search_page.dart';
import 'package:go_router/go_router.dart';

abstract final class SearchRoute {
  static final RouteBase route = GoRoute(
    path: RouterEnum.search.path,
    name: RouterEnum.search.name,
    builder: (context, state) => const SearchPage(),
  );
}
