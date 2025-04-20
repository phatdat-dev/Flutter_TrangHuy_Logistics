part of '../../app_router.dart';

class ForgotPassword1SelectRoute extends GoRouteData {
  const ForgotPassword1SelectRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ForgotPassword1SelectView();
}

class ForgotPassword2PinRoute extends GoRouteData {
  const ForgotPassword2PinRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ForgotPassword2PinView();
}

class ForgotPassword3NewPassRoute extends GoRouteData {
  const ForgotPassword3NewPassRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ForgotPassword3NewPassView();
}
