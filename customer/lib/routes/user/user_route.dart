part of '../app_router.dart';

//

@TypedGoRoute<UserRoute>(path: '/user')
class UserRoute extends GoRouteData {
  const UserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const UserView();
}
