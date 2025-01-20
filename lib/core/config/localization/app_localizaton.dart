import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension AppLocalizaton on BuildContext {
  bool get isEnglish => locale.languageCode == "en";

  void switchLang() {
    setLocale(isEnglish ? const Locale("ar") : const Locale("en"));
  }

  // List of supported app locales.
  static List<Locale> supportedAppLocals = const [
    Locale('en'),
    Locale('ar'),
  ];

  // Default starting locale for the app.
  static Locale startLocal = const Locale('en');
}
