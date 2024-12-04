import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';

class SearchResultBooksState {}

final class SearchResultBooksInitial extends SearchResultBooksState {}

final class SearchResultBooksSuccess extends SearchResultBooksState {
  final List<BookModel> books;

  SearchResultBooksSuccess({required this.books});
}

final class SearchResultBooksLoading extends SearchResultBooksState {}

final class SearchResultBooksFailure extends SearchResultBooksState {
  final String errorMessage;

  SearchResultBooksFailure({required this.errorMessage});
}
