import 'package:flutter/material.dart';
import 'package:package_core/package_core.dart';

class UserController extends BaseController {
  final ValueNotifier<UserModel?> state = ValueNotifier(null);

  @override
  Future<void> onInitData() async {}
}
