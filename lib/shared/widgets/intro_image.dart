import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_labs_task/generated/assets.dart';

class IntroImage extends StatelessWidget {
  const IntroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesIntroImage,
      width: 1.0.sw,
    );
  }
}
