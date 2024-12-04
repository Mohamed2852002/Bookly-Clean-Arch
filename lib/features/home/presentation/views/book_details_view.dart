import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_related_books_cubit/fetch_related_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchRelatedBooksCubit()
        ..fetchRelevantBooks(
            category: bookModel.volumeInfo?.categories?[0] ?? 'Sport'),
      child:  Scaffold(
        body: BookDetailsViewBody(bookModel: bookModel),
      ),
    );
  }
}
