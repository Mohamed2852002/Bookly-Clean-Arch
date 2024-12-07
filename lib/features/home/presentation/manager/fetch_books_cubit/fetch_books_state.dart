import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

class FetchBooksState {}

final class FetchBooksInitial extends FetchBooksState {}

final class FetchBooksLoading extends FetchBooksState {}

final class FetchBooksSuccess extends FetchBooksState {
  final List<BookEntity> books;

  FetchBooksSuccess({required this.books});
}

final class FetchBooksFailure extends FetchBooksState {
  final String errorMessage;

  FetchBooksFailure({required this.errorMessage});
}
