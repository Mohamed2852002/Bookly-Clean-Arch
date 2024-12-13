import 'package:bookly_clean_arch/core/widgets/custom_error_message_widget.dart';
import 'package:bookly_clean_arch/core/widgets/custom_loading_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_books_cubit/fetch_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_books_cubit/fetch_books_state.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBookksListViewBlocBuilder extends StatelessWidget {
  const CustomBookksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBooksCubit, FetchBooksState>(
      builder: (context, state) {
        if (state is FetchBooksSuccess) {
          return CustomBooksListView(books: state.books);
        }
        if (state is FetchBooksFailure) {
          return CustomErrorMessageWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
