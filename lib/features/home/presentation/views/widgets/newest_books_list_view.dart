import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/core/widgets/custom_error_message_widget.dart';
import 'package:bookly_clean_arch/core/widgets/custom_loading_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_state.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_list_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          if (state.books.isEmpty) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  'There was An Error, Try Again!',
                  style: Styles.textStyle16,
                ),
              ),
            );
          }
          return SliverPadding(
            padding: REdgeInsets.only(
              left: 30,
              right: 45,
              bottom: 16,
            ),
            sliver: SliverList.separated(
              separatorBuilder: (context, index) => const RSizedBox(height: 16),
              itemCount: state.books.length,
              itemBuilder: (context, index) =>
                  CustomBookListItem(bookModel: state.books[index]),
            ),
          );
        }
        if (state is FetchNewestBooksFailure) {
          return SliverFillRemaining(
              child:
                  CustomErrorMessageWidget(errorMessage: state.errorMessage));
        }
        return const SliverFillRemaining(child: CustomLoadingWidget());
      },
    );
  }
}
