import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/routes/app_router.dart';
import 'core/config/theme/app_theme.dart';
import 'core/constants/app_constants.dart';

class MyApp extends StatelessWidget {
  final String flavour;
  const MyApp({super.key, required this.flavour});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(AppConst.kMockupWidth, AppConst.kMockupHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, _) => MaterialApp.router(
        // Routing
        routerConfig: AppRouter.router,
        // Localization
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // Other
        darkTheme: AppTheme.lightTheme(context),
        theme: AppTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
