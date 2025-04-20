// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $notificationRoute,
  $settingRoute,
  $loginRoute,
  $registerRoute,
  $forgotPasswordRoute,
  $dashboardShellRouteData,
  $testViewRoute,
  $userRoute,
];

RouteBase get $notificationRoute => GoRouteData.$route(
  path: '/notification',

  factory: $NotificationRouteExtension._fromState,
);

extension $NotificationRouteExtension on NotificationRoute {
  static NotificationRoute _fromState(GoRouterState state) =>
      const NotificationRoute();

  String get location => GoRouteData.$location('/notification');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingRoute => GoRouteData.$route(
  path: '/setting',

  factory: $SettingRouteExtension._fromState,
);

extension $SettingRouteExtension on SettingRoute {
  static SettingRoute _fromState(GoRouterState state) => const SettingRoute();

  String get location => GoRouteData.$location('/setting');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',

  factory: $LoginRouteExtension._fromState,
);

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location('/login');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
  path: '/register',

  factory: $RegisterRouteExtension._fromState,
);

extension $RegisterRouteExtension on RegisterRoute {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  String get location => GoRouteData.$location('/register');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $forgotPasswordRoute => GoRouteData.$route(
  path: '/forgot-password',

  factory: $ForgotPasswordRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: 'step-1-select',

      factory: $ForgotPassword1SelectRouteExtension._fromState,
    ),
    GoRouteData.$route(
      path: 'step-2-pin',

      factory: $ForgotPassword2PinRouteExtension._fromState,
    ),
    GoRouteData.$route(
      path: 'step-3-new-pass',

      factory: $ForgotPassword3NewPassRouteExtension._fromState,
    ),
  ],
);

extension $ForgotPasswordRouteExtension on ForgotPasswordRoute {
  static ForgotPasswordRoute _fromState(GoRouterState state) =>
      const ForgotPasswordRoute();

  String get location => GoRouteData.$location('/forgot-password');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ForgotPassword1SelectRouteExtension on ForgotPassword1SelectRoute {
  static ForgotPassword1SelectRoute _fromState(GoRouterState state) =>
      const ForgotPassword1SelectRoute();

  String get location =>
      GoRouteData.$location('/forgot-password/step-1-select');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ForgotPassword2PinRouteExtension on ForgotPassword2PinRoute {
  static ForgotPassword2PinRoute _fromState(GoRouterState state) =>
      const ForgotPassword2PinRoute();

  String get location => GoRouteData.$location('/forgot-password/step-2-pin');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ForgotPassword3NewPassRouteExtension on ForgotPassword3NewPassRoute {
  static ForgotPassword3NewPassRoute _fromState(GoRouterState state) =>
      const ForgotPassword3NewPassRoute();

  String get location =>
      GoRouteData.$location('/forgot-password/step-3-new-pass');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dashboardShellRouteData => StatefulShellRouteData.$route(
  navigatorContainerBuilder: DashboardShellRouteData.$navigatorContainerBuilder,
  factory: $DashboardShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/', factory: $HomeRouteExtension._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/wallet',

          factory: $WalletRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/track',

          factory: $TrackRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/account',

          factory: $AccountRouteExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $DashboardShellRouteDataExtension on DashboardShellRouteData {
  static DashboardShellRouteData _fromState(GoRouterState state) =>
      const DashboardShellRouteData();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WalletRouteExtension on WalletRoute {
  static WalletRoute _fromState(GoRouterState state) => const WalletRoute();

  String get location => GoRouteData.$location('/wallet');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TrackRouteExtension on TrackRoute {
  static TrackRoute _fromState(GoRouterState state) => const TrackRoute();

  String get location => GoRouteData.$location('/track');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountRouteExtension on AccountRoute {
  static AccountRoute _fromState(GoRouterState state) => const AccountRoute();

  String get location => GoRouteData.$location('/account');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $testViewRoute => GoRouteData.$route(
  path: '/test-ui',

  factory: $TestViewRouteExtension._fromState,
);

extension $TestViewRouteExtension on TestViewRoute {
  static TestViewRoute _fromState(GoRouterState state) => const TestViewRoute();

  String get location => GoRouteData.$location('/test-ui');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userRoute =>
    GoRouteData.$route(path: '/user', factory: $UserRouteExtension._fromState);

extension $UserRouteExtension on UserRoute {
  static UserRoute _fromState(GoRouterState state) => const UserRoute();

  String get location => GoRouteData.$location('/user');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
