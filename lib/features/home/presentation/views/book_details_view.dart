import 'package:bookly_clean_arch/core/utils/functions/setup_service_locator.dart';
import 'package:bookly_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_related_books_use_case.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_related_books_cubit/fetch_related_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchRelatedBooksCubit(
        FetchRelatedBooksUseCase(
          homeRepo: getIt.get<HomeRepoImpl>(),
        ),
      )..fetchRelevantBooks(category: bookEntity.category ?? 'Sport'),
      child: Scaffold(
        body: BookDetailsViewBody(bookEntity: bookEntity),
      ),
    );
  }
}
