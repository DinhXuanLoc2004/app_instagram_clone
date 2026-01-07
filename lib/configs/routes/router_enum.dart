import 'package:app_instagram_clone/configs/routes/router_names.dart';

enum RouterEnum {
  signIn(name: RouterNames.SIGN_IN, path: '/${RouterNames.SIGN_IN}'),
  signUp(name: RouterNames.SIGN_UP, path: '/${RouterNames.SIGN_UP}'),
  feed(name: RouterNames.FEED, path: '/${RouterNames.FEED}'),
  search(name: RouterNames.SEARCH, path: '/${RouterNames.SEARCH}'),
  reel(name: RouterNames.REEL, path: '/${RouterNames.REEL}'),
  profile(name: RouterNames.PROFILE, path: '/${RouterNames.PROFILE}');

  const RouterEnum({required this.name, required this.path});
  final String name;
  final String path;
}
