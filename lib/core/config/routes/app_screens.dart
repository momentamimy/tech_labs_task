enum AppScreens {
  intro(path: "/intro"),
  onboarding(path: "/onboarding"),
  register(path: "/register"),
  home(path: "/home"),
  account(path: "/account"),
  profile(path: "/profile");

  const AppScreens({required this.path});

  final String path;
}
