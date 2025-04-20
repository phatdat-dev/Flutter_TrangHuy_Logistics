part of '../app_router.dart';

@TypedStatefulShellRoute<DashboardShellRouteData>(
  branches: [
    TypedStatefulShellBranch(routes: [TypedGoRoute<HomeRoute>(path: '/')]),
    TypedStatefulShellBranch(routes: [TypedGoRoute<WalletRoute>(path: '/wallet')]),
    TypedStatefulShellBranch(routes: [TypedGoRoute<TrackRoute>(path: '/track')]),
    TypedStatefulShellBranch(routes: [TypedGoRoute<AccountRoute>(path: '/account')]),
  ],
)
class DashboardShellRouteData extends StatefulShellRouteData {
  const DashboardShellRouteData();

  @override
  Widget builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
    return navigationShell;
  }

  static Widget $navigatorContainerBuilder(BuildContext context, StatefulNavigationShell navigationShell, List<Widget> children) {
    return CheckAppView(child: ScaffoldCurvedBottomnavView(navigationShell, children));
  }
}
