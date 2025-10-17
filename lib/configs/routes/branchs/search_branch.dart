import 'package:app_instagram_clone/configs/routes/routes/search_route.dart';
import 'package:go_router/go_router.dart';

abstract final class SearchBranchs {
  static final StatefulShellBranch branch = StatefulShellBranch(
    routes: [SearchRoute.route],
  );
}
