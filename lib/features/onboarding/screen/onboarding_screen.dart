import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tech_labs_task/core/config/theme/context_theme.dart';

import '../../../core/config/routes/app_screens.dart';
import '../../../generated/assets.dart';
import '../../../shared/widgets/app_logo.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.surfaceContainer,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppLogo(),
            20.verticalSpace,
            SizedBox(
              height: 380.h,
              child: PageView.builder(
                controller: pageController,
                itemCount: _OnboardingItems.values.length,
                itemBuilder: (context, index) => _OnBoardingPage(
                  currItem: _OnboardingItems.values[index],
                ),
              ),
            ),
            20.verticalSpace,
            Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: _OnboardingItems.values.length,
                effect: WormEffect(
                  paintStyle: PaintingStyle.stroke,
                  activeDotColor: context.primaryContainer,
                  dotColor: context.primaryContainer,
                  dotHeight: 12.r,
                  dotWidth: 12.r,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () => context.goNamed(AppScreens.register.name),
                child: Text(
                  "skip".tr(),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class _OnBoardingPage extends StatelessWidget {
  final _OnboardingItems currItem;

  const _OnBoardingPage({required this.currItem});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 25.w),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: context.surface,
            borderRadius: BorderRadius.circular(
              20.r,
            ),
          ),
          child: Column(
            children: [
              50.verticalSpace,
              Text(
                currItem.title.tr(),
                textAlign: TextAlign.center,
                style:
                    context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              20.verticalSpace,
              Text(
                currItem.description.tr(),
                textAlign: TextAlign.center,
                style:
                    context.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 40.r,
            backgroundColor: context.primary,
            child: SvgPicture.asset(
              currItem.icon,
              height: 40.r,
            ),
          ),
        ),
      ],
    );
  }
}

enum _OnboardingItems {
  first(
      icon: Assets.iconsOnboarding1Icon,
      title: "digital_transformation",
      description: "digital_transformation_desc"),
  second(
      icon: Assets.iconsOnboarding2Icon,
      title: "consultancy_services",
      description: "consultancy_services_desc"),
  third(
      icon: Assets.iconsOnboarding3Icon,
      title: "microsoft_licensing_service",
      description: "microsoft_licensing_service_desc"),
  ;

  final String icon;
  final String title;
  final String description;

  const _OnboardingItems(
      {required this.icon, required this.title, required this.description});
}
