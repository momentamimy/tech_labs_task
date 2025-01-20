import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tech_labs_task/core/config/theme/context_theme.dart';
import 'package:tech_labs_task/core/constants/app_constants.dart';
import 'package:tech_labs_task/features/profile/provider/profile_provider.dart';
import 'package:tech_labs_task/features/register/provider/register_provider.dart';
import 'package:tech_labs_task/injection_container.dart';
import 'package:tech_labs_task/shared/widgets/app_logo.dart';
import 'package:tech_labs_task/shared/widgets/app_text_field.dart';
import 'package:tech_labs_task/shared/widgets/rounded_button.dart';

import '../../../shared/widgets/bordered_rounded_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController =
      TextEditingController(text: RegisterProvider.userModel?.firstname ?? "");
  final lastNameController =
      TextEditingController(text: RegisterProvider.userModel?.lastname ?? "");
  final emailController = TextEditingController(
      text: RegisterProvider.userModel?.emailaddress1 ?? "");
  final passController =
      TextEditingController(text: RegisterProvider.userModel?.password ?? "");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileProvider>(
      create: (BuildContext context) => AppDependencies.sl(),
      builder: (context, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConst.kScreenHorizontalPadding.w,
              vertical: AppConst.kScreenVerticalPadding.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => context.pop(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.arrow_back),
                        5.horizontalSpace,
                        Text(
                          "profile".tr(),
                          style: context.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  40.verticalSpace,
                  Center(
                    child: AppLogo(height: 130.h),
                  ),
                  30.verticalSpace,
                  Card(
                    elevation: 5,
                    color: context.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      decoration: BoxDecoration(
                          color: context.primary,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Text(
                        "personal_info".tr(),
                        style: context.bodySmall?.apply(
                          color: context.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Consumer<ProfileProvider>(
                    builder: (context, provider, child) {
                      return Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppTextField(
                              readOnly: !provider.isEditable,
                              isOutlined: true,
                              labelText: "first_name".tr(),
                              controller: firstNameController,
                            ),
                            20.verticalSpace,
                            AppTextField(
                              readOnly: !provider.isEditable,
                              isOutlined: true,
                              labelText: "last_name".tr(),
                              controller: lastNameController,
                            ),
                            20.verticalSpace,
                            AppTextField(
                              readOnly: !provider.isEditable,
                              isOutlined: true,
                              labelText: "email".tr(),
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            20.verticalSpace,
                            AppTextField(
                              readOnly: !provider.isEditable,
                              isOutlined: true,
                              keyboardType: TextInputType.visiblePassword,
                              labelText: "password".tr(),
                              controller: passController,
                            ),
                            30.verticalSpace,
                            provider.isEditable
                                ? Row(
                                    children: [
                                      Expanded(
                                          child: BorderedRoundedButton(
                                              text: "cancel",
                                              onPressed: () {
                                                provider.isEditable = false;
                                              })),
                                      12.horizontalSpace,
                                      Expanded(
                                        child: provider.isLoading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : RoundedButton(
                                                text: "save",
                                                onPressed: () {
                                                  _saveEdit(context);
                                                },
                                              ),
                                      )
                                    ],
                                  )
                                : RoundedButton(
                                    text: "edit",
                                    onPressed: () {
                                      provider.isEditable = true;
                                    })
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveEdit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final provider = context.read<ProfileProvider>();
      await provider.editProfile(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passController.text,
      );
    }
  }
}
