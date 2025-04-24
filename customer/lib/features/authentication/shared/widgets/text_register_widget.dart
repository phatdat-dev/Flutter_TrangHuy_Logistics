import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core_datz/flutter_core_datz.dart';

import '../../../../routes/app_router.dart';

class TextRegisterWidget extends StatelessWidget {
  const TextRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?', style: TextStyle(color: Colors.grey)),
        TextButton(
          onPressed: () => context.replaceRoute(const LoginRoute()),
          child: const Text('Sign in', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

class TextLoginWidget extends StatelessWidget {
  const TextLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kToolbarHeight / 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Bạn đã có tài khoản?"),
          TextButton(
            onPressed: () => context.replaceRoute(const LoginRoute()),
            child: Text("Đăng nhập ngay!", style: TextStyle(color: context.theme.colorScheme.error)),
          ),
        ],
      ),
    );
  }
}
