import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_labs_task/features/onboarding/screen/onboarding_screen.dart';
import 'package:tech_labs_task/features/profile/screen/profile_screen.dart';
import '../../../features/account/screen/account_screen.dart';
import '../../../features/home/screen/home_screen.dart';
import '../../../features/intro/screen/intro_screen.dart';
import '../../../features/main/screen/main_screen.dart';
import '../../../features/register/screen/register_screen.dart';
import 'app_screens.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();

  static AppRouter get instance => _instance;

  AppRouter._internal() {
    // Router initialization happens here.
  }

  factory AppRouter() {
    return _instance;
  }

  /// Navigation Keys:
  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: AppScreens.account.path,
    routes: [
      myRoute(
        screenRoute: AppScreens.intro,
        screen: const IntroScreen(),
      ),
      myRoute(
        screenRoute: AppScreens.onboarding,
        screen: const OnboardingScreen(),
      ),
      myRoute(
        screenRoute: AppScreens.register,
        screen: const RegisterScreen(),
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) =>
            defaultTransitionAnimation(
                MainScreen(navigationShell: navigationShell), state),
        branches: [
          StatefulShellBranch(
            routes: [
              myRoute(
                  screenRoute: AppScreens.account,
                  screen: const AccountScreen(),),
            ],
          ),
          StatefulShellBranch(
            routes: [
              myRoute(
                screenRoute: AppScreens.home,
                screen: const HomeScreen(),
              ),
            ],
          ),
        ],
      ),
      myRoute(
        screenRoute: AppScreens.profile,
        screen: const ProfileScreen(),
      ),
    ],
  );

  static Page<dynamic> defaultTransitionAnimation(
      Widget child, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 10),
    );
  }

  static RouteBase myRoute({
    required AppScreens screenRoute,
    Widget? screen,
    GoRouterPageBuilder? pageBuilder,
    List<RouteBase>? routes,
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      parentNavigatorKey: parentNavigatorKey,
      routes: routes ?? <RouteBase>[],
      name: screenRoute.name,
      path: screenRoute.path,
      pageBuilder: pageBuilder ??
          (context, state) => defaultTransitionAnimation(screen!, state),
    );
  }
}
