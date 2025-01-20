import '../../constants/app_constants.dart';
import '../localization/app_localizaton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class _LightColorPalate {
  static const Color surface = Color(0xffffffff);
  static const Color secondary = Color(0xff3B3054);
  static const Color primary = Color(0xffCB2127);
  static const Color surfaceContainer = Color(0xffF0F1F6);
  static const Color secondaryContainer = Color(0xffDDA08E);
  static const Color primaryContainer = Color(0xffF46262);
  static const Color onSurface = Color(0xff232127);
  static const Color onSecondary = Color(0xff232127);
  static const Color onPrimary = Color(0xffffffff);
  static const Color error = Color(0xffCB2127);
  static const Color onError = Color(0xffffffff);
  static const Color hint = Color(0xffBFBFBF);
}

class AppTheme {

  static ThemeData lightTheme(BuildContext context) {
    TextTheme appTextTheme = Theme.of(context).textTheme.apply(
          displayColor: _LightColorPalate.onSurface,
          bodyColor: _LightColorPalate.onSurface,
          fontFamily: "Poppins",
        );

    return ThemeData(
      fontFamily: "Poppins",
      primaryColor: _LightColorPalate.primary,
      unselectedWidgetColor: _LightColorPalate.secondary,
      scaffoldBackgroundColor: _LightColorPalate.surface,
      canvasColor: _LightColorPalate.secondary,
      hintColor: _LightColorPalate.hint,
      highlightColor: _LightColorPalate.hint,
      textTheme: appTextTheme,
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(_LightColorPalate.primary),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: _LightColorPalate.primary,
        primaryContainer: _LightColorPalate.primaryContainer,
        secondaryContainer: _LightColorPalate.secondaryContainer,
        onPrimary: _LightColorPalate.onPrimary,
        secondary: _LightColorPalate.secondary,
        onSecondary: _LightColorPalate.onSecondary,
        error: _LightColorPalate.error,
        onError: _LightColorPalate.onError,
        surface: _LightColorPalate.surface,
        surfaceContainer: _LightColorPalate.surfaceContainer,
        onSurface: _LightColorPalate.onSurface,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: AppConst.kToolBarHeight.h,
        color: const Color(0xff212121),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(
          color: _LightColorPalate.onPrimary,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _LightColorPalate.primary,
        shape: const CircleBorder(),
        elevation: 0,
        sizeConstraints: BoxConstraints(
          minHeight: 32.r,
          minWidth: 32.r,
          maxWidth: 36.r,
          maxHeight: 36.r,
        ),
        smallSizeConstraints: BoxConstraints(
          minHeight: 24.r,
          minWidth: 24.r,
          maxWidth: 28.r,
          maxHeight: 28.r,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          maximumSize: const Size(double.infinity, double.infinity),
          minimumSize: const Size(double.infinity, 0),
          foregroundColor: _LightColorPalate.onPrimary,
          backgroundColor: _LightColorPalate.primary,
          elevation: 1,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          textStyle: appTextTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
        ),
      ),
      inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
            labelStyle: appTextTheme.bodyMedium!.copyWith(
              color: _LightColorPalate.hint,
            ),
            border: _inputBorder(_LightColorPalate.onSurface),
            focusedBorder: _inputBorder(_LightColorPalate.onSurface),
            errorBorder: _inputBorder(_LightColorPalate.error),
            enabledBorder: _inputBorder(_LightColorPalate.onSurface),
            disabledBorder: _inputBorder(Colors.white.withOpacity(.3)),
            focusedErrorBorder: _inputBorder(_LightColorPalate.error),
          ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _LightColorPalate.onSurface,
      ),
    );
  }


  static UnderlineInputBorder _inputBorder(Color color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
