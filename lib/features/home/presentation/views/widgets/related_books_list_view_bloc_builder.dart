import 'package:bookly_clean_arch/core/widgets/custom_error_message_widget.dart';
import 'package:bookly_clean_arch/core/widgets/custom_loading_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_related_books_cubit/fetch_related_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_related_books_cubit/fetch_related_books_state.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/related_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedBooksListViewBlocBuilder extends StatelessWidget {
  const RelatedBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchRelatedBooksCubit, FetchRelatedBooksState>(
      builder: (context, state) {
        if (state is FetchRelatedBooksSuccess) {
          return RelatedBooksListView(books: state.books);
        } else if (state is FetchRelatedBooksFailure) {
          return CustomErrorMessageWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
