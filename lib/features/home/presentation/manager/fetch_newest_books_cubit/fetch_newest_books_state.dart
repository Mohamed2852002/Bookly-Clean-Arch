import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';

class FetchNewestBooksState {}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}

final class FetchNewestBooksLoading extends FetchNewestBooksState {}

final class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookModel> books;

  FetchNewestBooksSuccess({required this.books});
}

final class FetchNewestBooksFailure extends FetchNewestBooksState {
  final String errorMessage;

  FetchNewestBooksFailure({required this.errorMessage});
}
