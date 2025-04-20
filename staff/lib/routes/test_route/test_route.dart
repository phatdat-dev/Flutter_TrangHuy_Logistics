part of '../app_router.dart';

//

@TypedGoRoute<TestViewRoute>(path: '/test-ui')
class TestViewRoute extends GoRouteData {
  const TestViewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TestView();
}
