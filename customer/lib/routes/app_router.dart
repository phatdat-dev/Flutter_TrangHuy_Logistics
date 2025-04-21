import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_core_datz/flutter_core_datz.dart' as datz;
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:package_core/package_core.dart';

import '../features/authentication/forgot_password/view/forgot_password_1_select_view.dart';
import '../features/authentication/forgot_password/view/forgot_password_2_pin_view.dart';
import '../features/authentication/forgot_password/view/forgot_password_3_newpass_view.dart';
import '../features/authentication/login/view/login_view.dart';
import '../features/authentication/register/view/register_view.dart';
import '../features/notification/view/notification_view.dart';
import '../features/onboarding/view/onboarding_view.dart';
import '../features/scaffold/account/view/account_view.dart';
import '../features/scaffold/home/view/home_view.dart';
import '../features/scaffold/scaffold_curved_bottomnav_view.dart';
import '../features/scaffold/track/view/track_view.dart';
import '../features/scaffold/wallet/view/wallet_view.dart';
import '../features/setting/view/setting_view.dart';
import '../features/user/controller/user_controller.dart';
import '../features/user/view/user_view.dart';
import '../shared/widgets/test_widget/test_view.dart';

part 'app_router.g.dart';
part 'authentication/authentication_route.dart';
part 'authentication/forgot_password/forgot_password_branch_route.dart';
part 'authentication/forgot_password/forgot_password_route.dart';
part 'onboarding/onboarding_route.dart';
part 'scaffold/scaffold_branch_route.dart';
part 'scaffold/scaffold_route.dart';
part 'test_route/test_route.dart';
part 'user/user_route.dart';

String get _initialRoute {
  if (GetIt.instance<UserController>().onBoardingSuccess) {
    return const HomeRoute().location;
  } else {
    return const OnboardingRoute().location;
  }
}

final goRouterProvider = GoRouter(
  initialLocation: _initialRoute,
  navigatorKey: datz.AppGlobals.rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [...$appRoutes, ...datz.$appRoutes],
  // observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)],
);

/*
int _random = -1;
CustomTransitionPage _buildPage(BuildContext context, GoRouterState state, Widget child) {
  final list = PageTransitionType.getValueWithoutPop;
  _random += 1;
  if (_random > list.length - 1) _random = 0;

  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return buildTransitionss(context, animation, secondaryAnimation, child, type: list.elementAt(_random), alignment: Alignment.center);
    },
  );
}
*/
//

@TypedGoRoute<NotificationRoute>(path: '/notification')
class NotificationRoute extends GoRouteData {
  const NotificationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const NotificationView();
}
//

@TypedGoRoute<SettingRoute>(path: '/setting')
class SettingRoute extends GoRouteData {
  const SettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SettingView();
}
