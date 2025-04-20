import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core_datz/flutter_core_datz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:package_core/package_core.dart';

import 'app/app_constants.dart';
import 'app/app_theme.dart';
import 'features/setting/controller/setting_controller.dart';
import 'features/user/controller/user_controller.dart';
import 'routes/app_router.dart';
import 'shared/datasource/local/my_storage_service.dart';

void main() => runMain(
  configs: MyConfigs(),
  onInit: () async {
    HttpOverrides.global = MyHttpoverrides();
    await dotenv.load(fileName: AssetsCore.aEnv);
    await _initSingletons();
    await _initFirebase();
    await _initOpenAI();
    //
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  },
);

class MyConfigs extends BaseConfigs {
  @override
  String get appTitle => AppConstants.appName;

  @override
  GoRouter router(BuildContext context) => goRouterProvider;

  @override
  ThemeState get themeState => ThemeState(lightTheme: AppTheme.lightTheme, darkTheme: AppTheme.darkTheme);

  @override
  TranslationController get translationController => TranslationController(
    startLocale: const Locale('en', 'US'),
    locales: const [Locale('en', 'US'), Locale('vi', 'VN'), Locale('ja', 'JP'), Locale('cs', 'CZ')],
  );

  @override
  AssetsPath get assetsPath => AssetsPath(imageError: AssetsCore.images.logo.logoRemovebgCrop512x512.path);

  @override
  StorageService get storageService => MyStorageService();
}

// Allow access http, ex: (localhost ip >> 0.0.0.0)
class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> _initSingletons() async {
  GetIt.instance.registerLazySingleton<UserController>(() => UserController()..onInitData());
  GetIt.instance.registerLazySingleton<DioNetworkService>(() => DioNetworkService());
  GetIt.instance.registerSingleton<SettingController>(SettingController()..onInitData());
}

Future<void> _initFirebase() async {
  // if (!_isDevMode) {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // GetIt.instance.registerSingleton<FireBaseService>(
  //   FireBaseService()
  //     ..remoteConfigServiceInitialize()
  //     ..notificationServiceInitialize(),
  // );
  // FlutterError.onError = (FlutterErrorDetails details) => FirebaseCrashlytics.instance.recordFlutterError(details);

  // }
}

Future<void> _initOpenAI() async {
  // OpenAI.apiKey = AppENV.KEY_OpenAI;
  // OpenAI.showLogs = true;
}
