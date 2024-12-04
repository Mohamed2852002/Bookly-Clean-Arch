import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_clean_arch/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchTextField(),
            const RSizedBox(height: 16),
            Text(
              'Search Result :',
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const RSizedBox(height: 16),
            const SearchResultBooksListView(),
          ],
        ),
      ),
    );
  }
}
