part of '../app_router.dart';

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  // static final GlobalKey<NavigatorState> $parentNavigatorKey = datz.AppGlobals.rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginView();
}

//
@TypedGoRoute<RegisterRoute>(path: '/register')
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const RegisterView();
}
