import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core_datz/flutter_core_datz.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:package_core/package_core.dart';

import '../../../../app/app_constants.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../routes/app_router.dart';
import '../../shared/widgets/social_button_widget.dart';
import '../../shared/widgets/textfield_password_widget.dart';
import '../controller/login_controller.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginController controller;
  @override
  void initState() {
    controller = LoginController()..onInitData();
    super.initState();
  }

  void _onForgotPassword() => const ForgotPassword1SelectRoute().push(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingContent),
            child: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: AssetsCore.images.logo.logoRemovebgCrop512x512.image(width: 200, height: 200)),
                          // Text(
                          //   AppConstants.appName,
                          //   style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                          //   textAlign: TextAlign.center,
                          // ),
                          SizedBox(height: context.height * 0.02),
                          Text('Wellcome', style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text(
                            "Fill in your email and password to continue",
                            style: context.textTheme.titleMedium?.copyWith(color: Theme.of(context).hintColor),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: FormBuilder(
                              key: LoginController.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FormBuilderTextField(
                                    enableSuggestions: true,
                                    name: "username",
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person_outline, color: context.theme.unselectedWidgetColor),
                                      labelText: LocaleKeys.LoginView_Username.tr(),
                                    ),
                                    validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                                    initialValue: "Guest",
                                  ),
                                  SizedBox(height: context.height * 0.02),
                                  FormBuilderTextFieldPasswordWidget(initialValue: "123", labelText: LocaleKeys.LoginView_Password.tr()),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: FormBuilderCheckbox(
                                          name: "remember",
                                          initialValue: true,
                                          onChanged: (value) {},
                                          title: const Text("Remember password"),
                                        ),
                                      ),
                                      TextButton(onPressed: _onForgotPassword, child: Text(LocaleKeys.LoginView_ForgotPassword.tr())),
                                    ],
                                  ),
                                  const SizedBox(height: 100),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: FilledButton.icon(
                                      onPressed: () => controller.onLogin(),
                                      icon: controller.isLoadding.builder(
                                        (context, isLoaddingValue) =>
                                            isLoaddingValue
                                                ? SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: CircularProgressIndicator(color: Theme.of(context).colorScheme.surface, strokeWidth: 3),
                                                )
                                                : const SizedBox.shrink(),
                                      ),
                                      label: Text(LocaleKeys.Login.tr()),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Don't have an account?", style: TextStyle(color: Colors.grey)),
                                      TextButton(
                                        onPressed: () => context.replaceRoute(const RegisterRoute()),
                                        child: const Text('Sign up', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  const SocialButtonWidget(),
                                ],
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: kToolbarHeight / 2),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Text("Bạn không có tài khoản ?".tr()),
                          //       TextButton(
                          //         onPressed: () {},
                          //         child: Text(
                          //           "Đăng ký tại đây".tr(),
                          //           style: TextStyle(color: context.theme.colorScheme.error),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
