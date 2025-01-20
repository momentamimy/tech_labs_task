import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_labs_task/core/config/theme/context_theme.dart';
import 'package:tech_labs_task/core/constants/app_constants.dart';
import 'package:tech_labs_task/generated/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              30.verticalSpace,
              const _CompanyLogo(),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConst.kScreenHorizontalPadding.w,
                  vertical: AppConst.kScreenVerticalPadding.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "our_services".tr(),
                      style: context.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    _HomeItemCard(
                      icon: Assets.iconsDigitalTransformationIcon,
                      title: "digital_transformation".tr(),
                      hint:
                          "digital_transformation_hint".tr(),
                      body:
                          "digital_transformation_body".tr(),
                    ),
                    10.verticalSpace,
                    _HomeItemCard(
                      icon: Assets.iconsConsultancyServicesIcon,
                      title: "consultancy_services".tr(),
                      hint:
                          "consultancy_services_hint".tr(),
                      body:
                          "consultancy_services_body".tr(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CompanyLogo extends StatelessWidget {
  const _CompanyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Assets.imagesHomeImage, width: 1.sw, fit: BoxFit.fitWidth),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.verticalSpace,
              Text(
                "TechLabs London",
                style: context.titleLarge
                    ?.copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700),
              ),
              Text(
                "Microsoft AI Cloud Solution Partner",
                style: context.bodySmall?.copyWith(
                    fontSize: 9.5.sp,
                    color: context.primary,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HomeItemCard extends StatelessWidget {
  final String icon;
  final String title;
  final String hint;
  final String body;

  const _HomeItemCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.hint,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: context.onPrimary,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  icon,
                  width: 80.w,
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.titleSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      10.verticalSpace,
                      Text(
                        hint,
                        style: context.labelSmall?.copyWith(
                            fontSize: 10.sp, color: context.hintColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
            10.verticalSpace,
            Text(
              body,
              style: context.labelSmall?.copyWith(fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }
}
