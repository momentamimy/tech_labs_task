part of '../screen/main_screen.dart';

class _AppBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const _AppBottomNavBar({
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surface,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: context.hintColor,
            blurRadius: 3,
          ),
        ],
      ),
      child: BottomNavigationBar(
        /// Texts:
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        selectedItemColor: context.primary,
        unselectedItemColor: context.primary.withOpacity(0.3),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        /// Others:
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.surface,
        currentIndex: currentIndex,
        onTap: (index) {
          final currIcon = _NavIcon.values[index];
          switch (currIcon) {
            case _NavIcon.account:
              context.goNamed(AppScreens.account.name);
              break;
            case _NavIcon.home:
              context.goNamed(AppScreens.home.name);
              break;
          }
        },
        items: List.generate(
          _NavIcon.values.length,
          (index) => _getBottomNavItem(_NavIcon.values[index], context),
        ),
      ),
    );
  }

  BottomNavigationBarItem _getBottomNavItem(
      _NavIcon currIcon, BuildContext context) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        currIcon.icon,
      ),
        icon: SvgPicture.asset(
          currIcon.icon,
          color: context.primary.withOpacity(0.3),
        ),
        label: currIcon.name.tr());
  }
}

enum _NavIcon {
  account(icon: Assets.iconsAccountIcon),
  home(icon: Assets.iconsHomeIcon);

  final String icon;

  const _NavIcon({required this.icon});
}
