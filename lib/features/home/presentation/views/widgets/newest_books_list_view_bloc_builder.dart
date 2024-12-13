import 'package:bookly_clean_arch/core/widgets/custom_error_message_widget.dart';
import 'package:bookly_clean_arch/core/widgets/custom_loading_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_state.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          return NewestBooksListView(books: state.books);
        }
        if (state is FetchNewestBooksFailure) {
          return SliverFillRemaining(
            child: CustomErrorMessageWidget(
              errorMessage: state.errorMessage,
            ),
          );
        }
        return const SliverFillRemaining(
          child: CustomLoadingWidget(),
        );
      },
    );
  }
}
