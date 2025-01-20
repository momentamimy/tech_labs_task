import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/config/routes/app_screens.dart';
import '../../../core/config/theme/context_theme.dart';
import '../../../generated/assets.dart';

part '../widgets/app_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _AppBottomNavBar(
        currentIndex: navigationShell.currentIndex,
      ),
    );
  }
}
