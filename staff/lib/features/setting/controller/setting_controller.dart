import 'package:flutter/material.dart';
import 'package:package_core/package_core.dart';

import '../datasource/local/setting_local_datasource.dart';

class SettingController extends BaseController {
  final ValueNotifier<String> avatarUrl = ValueNotifier('');
  final _localDatasource = SettingLocalDatasource();

  @override
  Future<void> onInitData() async {}

  // ------------------------------------------------------------

  void changeAvatarUrl(String url) {
    avatarUrl.value = url;
    _localDatasource.saveAvatarUrl(url);
  }

  void loadAvatarUrl() async {
    final result = await _localDatasource.getAvatarUrl();
    result.fold((error) {}, (data) => avatarUrl.value = data);
  }

  // ------------------------------------------------------------
}
