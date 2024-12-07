import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/core/widgets/custom_error_message_widget.dart';
import 'package:bookly_clean_arch/core/widgets/custom_loading_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_books_cubit/fetch_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_books_cubit/fetch_books_state.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBooksListView extends StatelessWidget {
  const CustomBooksListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBooksCubit, FetchBooksState>(
      builder: (context, state) {
        if (state is FetchBooksSuccess) {
          if (state.books.isEmpty) {
            return Center(
              child: Text(
                'There was An Error, Try Again!',
                style: Styles.textStyle16,
              ),
            );
          }
          return RSizedBox(
            height: 225,
            child: ListView.separated(
              padding: REdgeInsets.only(left: 30),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  CustomListViewItem(bookModel: BookModel()),
              separatorBuilder: (context, index) => const RSizedBox(width: 12),
              itemCount: state.books.length,
            ),
          );
        }
        if (state is FetchBooksFailure) {
          return CustomErrorMessageWidget(errorMessage: state.errorMessage);
        }
        return const CustomLoadingWidget();
      },
    );
  }
}
