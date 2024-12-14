import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListViewItemLoadingIndicator extends StatelessWidget {
  const CustomListViewItemLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child:  Container(
        width: 150.w,
        height: 225.h,
        color: Colors.grey,
      ),
    );
  }
}
