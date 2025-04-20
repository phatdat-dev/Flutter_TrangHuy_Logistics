part of '../../app_router.dart';

@TypedGoRoute<ForgotPasswordRoute>(
  path: '/forgot-password',
  routes: [
    TypedGoRoute<ForgotPassword1SelectRoute>(path: 'step-1-select'),
    TypedGoRoute<ForgotPassword2PinRoute>(path: 'step-2-pin'),
    TypedGoRoute<ForgotPassword3NewPassRoute>(path: 'step-3-new-pass'),
  ],
)
class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SizedBox.shrink();
}
