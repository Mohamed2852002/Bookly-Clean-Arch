import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

class FetchNewestBooksState {}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}

final class FetchNewestBooksLoading extends FetchNewestBooksState {}

final class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookEntity> books;

  FetchNewestBooksSuccess({required this.books});
}

final class FetchNewestBooksFailure extends FetchNewestBooksState {
  final String errorMessage;

  FetchNewestBooksFailure({required this.errorMessage});
}
