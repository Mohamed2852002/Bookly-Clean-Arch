import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 30),
      child: Text(
        'Newest Books',
        style: Styles.textStyle18.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
