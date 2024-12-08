import 'package:bookly_clean_arch/core/widgets/custom_error_message_widget.dart';
import 'package:bookly_clean_arch/core/widgets/custom_loading_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_list_book_item.dart';
import 'package:bookly_clean_arch/features/search/presentation/manager/search_result_books_cubit/search_result_books_cubit.dart';
import 'package:bookly_clean_arch/features/search/presentation/manager/search_result_books_cubit/search_result_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultBooksListView extends StatelessWidget {
  const SearchResultBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultBooksCubit, SearchResultBooksState>(
      builder: (context, state) {
        if (state is SearchResultBooksSuccess) {
          return Expanded(
            child: ListView.separated(
              padding: REdgeInsets.only(top: 12),
              separatorBuilder: (context, index) => const RSizedBox(height: 16),
              itemCount: state.books.length,
              itemBuilder: (context, index) =>
                  CustomBookListItem(bookEntity: state.books[index]),
            ),
          );
        } else if (state is SearchResultBooksFailure) {
          return Expanded(
            child: CustomErrorMessageWidget(
              errorMessage: state.errorMessage,
            ),
          );
        } else if (state is SearchResultBooksInitial) {
          return const Expanded(
            child: CustomErrorMessageWidget(
              errorMessage: 'Search Books',
            ),
          );
        } else {
          return const Expanded(
            child: CustomLoadingWidget(),
          );
        }
      },
    );
  }
}
