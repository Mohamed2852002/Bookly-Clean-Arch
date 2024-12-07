import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_books_use_case.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_books_cubit/fetch_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBooksCubit extends Cubit<FetchBooksState> {
  FetchBooksCubit(this.fetchBooksUseCase) : super(FetchBooksInitial());
  final FetchBooksUseCase fetchBooksUseCase;
  fetchBooks() async {
    emit(FetchBooksLoading());
    var data = await fetchBooksUseCase.call();
    data.fold(
      (failure) {
        emit(FetchBooksFailure(errorMessage: failure.errorMessage));
      },
      (booksList) {
        emit(FetchBooksSuccess(books: booksList));
      },
    );
  }
}
