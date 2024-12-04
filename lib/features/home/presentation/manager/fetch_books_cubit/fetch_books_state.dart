import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';

class FetchBooksState {}

final class FetchBooksInitial extends FetchBooksState {}

final class FetchBooksLoading extends FetchBooksState {}

final class FetchBooksSuccess extends FetchBooksState {
  final List<BookModel> books;

  FetchBooksSuccess({required this.books});
}

final class FetchBooksFailure extends FetchBooksState {
  final String errorMessage;

  FetchBooksFailure({required this.errorMessage});
}
