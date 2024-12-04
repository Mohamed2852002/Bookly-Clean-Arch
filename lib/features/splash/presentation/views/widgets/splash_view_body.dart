import 'package:bookly_clean_arch/core/utils/assets.dart';
import 'package:bookly_clean_arch/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          Assets.logo,
          height: 50.h,
        ),
        const RSizedBox(height: 16),
        const SlidingText(),
      ],
    );
  }
}
