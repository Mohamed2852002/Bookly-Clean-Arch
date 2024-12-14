import 'package:bookly_clean_arch/core/widgets/custom_fading_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_list_view_item_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBooksListViewLoadingIndicator extends StatelessWidget {
  const CustomBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: RSizedBox(
        height: 225,
        child: ListView.separated(
          padding: REdgeInsets.only(left: 30),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
             const CustomListViewItemLoadingIndicator() ,
          separatorBuilder: (context, index) => const RSizedBox(width: 12),
          itemCount: 15,
        ),
      ),
    );
  }
}