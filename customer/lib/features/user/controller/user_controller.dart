import 'package:flutter/material.dart';
import 'package:flutter_core_datz/flutter_core_datz.dart';
import 'package:get_it/get_it.dart';
import 'package:package_core/package_core.dart';

import '../../../app/storage_constants.dart';

class UserController extends BaseController {
  final ValueNotifier<UserModel?> state = ValueNotifier(null);
  bool onBoardingSuccess = false;

  @override
  Future<void> onInitData() async {
    onBoardingSuccess = await checkBoardingSuccess();
  }

  Future<bool> checkBoardingSuccess() async => GetIt.instance<StorageService>().sharedPreferences?.getBool(StorageConstants.boardingSuccess) ?? false;
  Future<void> setBoardingSuccess() async {
    await GetIt.instance<StorageService>().sharedPreferences?.setBool(StorageConstants.boardingSuccess, true);
  }
}
