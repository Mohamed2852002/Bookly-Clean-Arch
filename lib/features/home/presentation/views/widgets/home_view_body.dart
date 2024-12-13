import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_bookks_list_view_bloc_builder.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_text.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/newest_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              RSizedBox(height: 35),
              CustomBookksListViewBlocBuilder(),
              RSizedBox(height: 50),
              CustomText(),
              RSizedBox(height: 20),
            ],
          ),
        ),
        NewestBooksListViewBlocBuilder(),
      ],
    );
  }
}
