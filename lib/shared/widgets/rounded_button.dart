import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Widget? startIcon;
  final Widget? endIcon;
  final Function() onPressed;

  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? splashColor;

  final double? width, radius, verticalPadding;

  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.radius,
    this.verticalPadding,
    this.backgroundColor,
    this.textColor,
    this.splashColor,
    this.startIcon,
    this.endIcon, this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
                  backgroundColor:
                      backgroundColor ?? Theme.of(context).colorScheme.primary,
                  shadowColor: Colors.transparent,
                  foregroundColor: backgroundColor,
                  surfaceTintColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius ?? 5.r),
                  ))
              .copyWith(
                  overlayColor: WidgetStatePropertyAll(
                      splashColor ?? Colors.white.withOpacity(0.2))),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (startIcon != null) ...[
                  startIcon!,
                  4.horizontalSpace,
                ],
                Text(
                  text,
                  style: textStyle??TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.r,
                    color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                  ),
                ),

                if (endIcon != null) ...[
                  4.horizontalSpace,
                  endIcon!,
                ],
              ],
            ),
          )),
    );
  }
}
