import 'package:bookly_clean_arch/core/utils/functions/show_custom_snack_bar.dart';
import 'package:bookly_clean_arch/core/widgets/custom_error_message_widget.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_books_cubit/fetch_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_books_cubit/fetch_books_state.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_books_list_view.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBookksListViewBlocConsumer extends StatefulWidget {
  const CustomBookksListViewBlocConsumer({super.key});

  @override
  State<CustomBookksListViewBlocConsumer> createState() =>
      _CustomBookksListViewBlocConsumerState();
}

class _CustomBookksListViewBlocConsumerState
    extends State<CustomBookksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchBooksCubit, FetchBooksState>(
      listener: (context, state) {
        if (state is FetchBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FetchBooksPaginationFailure) {
          showCustomSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is FetchBooksSuccess ||
            state is FetchBooksPaginationLoading ||
            state is FetchBooksPaginationFailure) {
          return CustomBooksListView(books: books);
        }
        if (state is FetchBooksFailure) {
          return CustomErrorMessageWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomBooksListViewLoadingIndicator();
        }
      },
    );
  }
}
