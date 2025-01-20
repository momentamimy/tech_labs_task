import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_labs_task/core/config/routes/app_screens.dart';
import 'package:tech_labs_task/core/config/theme/context_theme.dart';
import 'package:tech_labs_task/shared/widgets/app_logo.dart';
import 'package:tech_labs_task/shared/widgets/rounded_button.dart';

import '../../../shared/widgets/intro_image.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppLogo(),
            20.verticalSpace,
            const IntroImage(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "impactful_innovation_rapidly_deployed".tr(),
                      textAlign: TextAlign.center,
                      style: context.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600, height: 1.7),
                    ),
                    Text(
                      "build_your_tailored_solutions_for_your_industry".tr(),
                      textAlign: TextAlign.center,
                      style: context.bodyMedium,
                    ),
                    RoundedButton(
                      text: "start".tr(),
                      onPressed: () => context.goNamed(AppScreens.onboarding.name),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
