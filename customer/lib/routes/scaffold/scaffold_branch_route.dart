part of '../app_router.dart';

// // ShellBranchData
// class HomeShellBranchData extends StatefulShellBranchData {
//   const HomeShellBranchData();

//   static final GlobalKey<NavigatorState> $navigatorKey = GlobalKey<NavigatorState>();
// }

// class MessageShellBranchData extends StatefulShellBranchData {
//   const MessageShellBranchData();

//   static final GlobalKey<NavigatorState> $navigatorKey = GlobalKey<NavigatorState>();
// }

// class NotificationShellBranchData extends StatefulShellBranchData {
//   const NotificationShellBranchData();

//   static final GlobalKey<NavigatorState> $navigatorKey = GlobalKey<NavigatorState>();
// }

// class AccountShellBranchData extends StatefulShellBranchData {
//   const AccountShellBranchData();

//   static final GlobalKey<NavigatorState> $navigatorKey = GlobalKey<NavigatorState>();
// }

// RouteData
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeView();
}

class WalletRoute extends GoRouteData {
  const WalletRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WalletView();
}

class TrackRoute extends GoRouteData {
  const TrackRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TrackView();
}

class AccountRoute extends GoRouteData {
  const AccountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AccountView();
}
