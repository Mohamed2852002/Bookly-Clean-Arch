import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/core/utils/assets.dart';
import 'package:bookly_clean_arch/core/utils/constants.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.only(
          left: 30,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(Assets.logo),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: Icon(
                Icons.search,
                size: 30.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
