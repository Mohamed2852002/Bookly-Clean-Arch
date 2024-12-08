import 'package:bookly_clean_arch/core/widgets/custom_error_message_widget.dart';
import 'package:bookly_clean_arch/core/widgets/custom_loading_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_related_books_cubit/fetch_related_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_related_books_cubit/fetch_related_books_state.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/related_books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedBooksListView extends StatelessWidget {
  const RelatedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchRelatedBooksCubit, FetchRelatedBooksState>(
      builder: (context, state) {
        if (state is FetchRelatedBooksSuccess) {
          return RSizedBox(
            height: 110,
            child: ListView.separated(
              padding: REdgeInsets.only(left: 30),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  RelatedBooksListViewItem(bookEntity: state.books[index]),
              itemCount: state.books.length,
              separatorBuilder: (context, index) => const RSizedBox(width: 10),
            ),
          );
        } else if (state is FetchRelatedBooksFailure) {
          return CustomErrorMessageWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
