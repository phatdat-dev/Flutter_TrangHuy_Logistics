import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../generated/locale_keys.g.dart';
import '../../authentication/login/controller/login_controller.dart';

class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({super.key, this.backgroundColor, this.foregroundColor});
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () => LoginController.onLogout(),
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).highlightColor.withValues(alpha: 0.2),
          foregroundColor: foregroundColor ?? Theme.of(context).colorScheme.onSurface,
          side: Theme.of(context).inputDecorationTheme.enabledBorder?.borderSide ?? BorderSide.none,
        ),
        child: Text(LocaleKeys.Logout.tr()),
      ),
    );
  }
}
