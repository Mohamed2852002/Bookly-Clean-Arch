import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

class FetchRelatedBooksState {
  const FetchRelatedBooksState();
}

final class FetchRelatedBooksInitial extends FetchRelatedBooksState {}

final class FetchRelatedBooksSuccess extends FetchRelatedBooksState {
  final List<BookEntity> books;

  FetchRelatedBooksSuccess({required this.books});
}

final class FetchRelatedBooksLoading extends FetchRelatedBooksState {}

final class FetchRelatedBooksFailure extends FetchRelatedBooksState {
  final String errorMessage;

  FetchRelatedBooksFailure({required this.errorMessage});
}
