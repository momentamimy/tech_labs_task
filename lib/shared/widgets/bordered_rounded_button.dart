import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/config/theme/context_theme.dart';

class BorderedRoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  final Color? color;
  final Color? textColor;

  final double? width, radius, verticalPadding;

  const BorderedRoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.radius,
    this.verticalPadding,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
          onPressed: () => onPressed(),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 5.r),
              side: BorderSide(
                width: 0.5.r,
                color: color ?? context.primary,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 5.r),
            ),
            padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color:
                        textColor ?? Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
