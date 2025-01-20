import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_labs_task/core/config/routes/app_screens.dart';
import 'package:tech_labs_task/core/config/theme/context_theme.dart';
import 'package:tech_labs_task/core/constants/app_constants.dart';
import 'package:tech_labs_task/features/register/provider/register_provider.dart';

import '../../../generated/assets.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConst.kScreenHorizontalPadding.w,
          vertical: AppConst.kScreenVerticalPadding.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  Assets.iconsAppLogoWithRedBgd,
                  height: 100.h,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      context.goNamed(AppScreens.register.name);
                    },
                    icon: SvgPicture.asset(Assets.iconsLogout))
              ],
            ),
            10.verticalSpace,
            Text(
              "${"welcome".tr()}\n${RegisterProvider.userModel?.firstname ?? ""}",
              style:
                  context.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
            30.verticalSpace,
            _AccountItemButton(
              title: "profile".tr(),
              onPressed: () {
                context.pushNamed(AppScreens.profile.name);
              },
            ),
            10.verticalSpace,
            _AccountItemButton(
              title: "notification".tr(),
              onPressed: () {},
            ),
            10.verticalSpace,
            _AccountItemButton(
              title: "change_password".tr(),
              onPressed: () {},
            ),
            10.verticalSpace,
            _AccountItemButton(
              title: "manage_account".tr(),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class _AccountItemButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const _AccountItemButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(title,style: context.titleSmall,),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right_rounded)
          ],
        ),
      ),
    );
  }
}
