import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tech_labs_task/core/config/routes/app_screens.dart';
import 'package:tech_labs_task/core/config/theme/context_theme.dart';
import 'package:tech_labs_task/features/register/provider/register_provider.dart';
import 'package:tech_labs_task/injection_container.dart';
import 'package:tech_labs_task/shared/widgets/auth_text_field.dart';

import '../../../generated/assets.dart';
import '../../../shared/widgets/app_logo.dart';
import '../../../shared/widgets/intro_image.dart';
import '../../../shared/widgets/rounded_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterProvider>(
      create: (BuildContext context) => AppDependencies.sl(),
      builder: (context, child) => Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh,
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppLogo(),
                    10.verticalSpace,
                    const IntroImage(),
                    10.verticalSpace,
                    Expanded(
                      child: Container(
                        width: 1.sw,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.imagesRegisterBgdImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AuthTextField(
                                    hint: "first_name".tr(),
                                    controller: firstNameController,
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: AuthTextField(
                                    hint: "last_name".tr(),
                                    controller: lastNameController,
                                  ),
                                ),
                              ],
                            ),
                            AuthTextField(
                              hint: "email".tr(),
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            AuthTextField(
                              hint: "password".tr(),
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            Center(
                              child: Selector<RegisterProvider, bool>(
                                selector: (context, provider) =>
                                    provider.isLoading,
                                builder: (context, isLoading, child) {
                                  return isLoading
                                      ? CircularProgressIndicator(
                                          color: context.onPrimary,
                                        )
                                      : RoundedButton(
                                          text: "register".tr(),
                                          onPressed: () => _register(context),
                                        );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final provider = context.read<RegisterProvider>();
      await provider.register(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      if (RegisterProvider.userModel != null) {
        context.goNamed(AppScreens.account.name);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
