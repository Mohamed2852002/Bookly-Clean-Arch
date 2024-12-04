import 'package:bookly_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_books_cubit/fetch_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBooksCubit extends Cubit<FetchBooksState> {
  FetchBooksCubit() : super(FetchBooksInitial());
  fetchBooks() async {
    emit(FetchBooksLoading());
    var data = await HomeRepoImpl().fetchBooks();
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
