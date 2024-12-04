import 'package:bookly_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit() : super(FetchNewestBooksInitial());
  fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    var data = await HomeRepoImpl().fetchNewestBooks();
    data.fold(
      (failure) {
        emit(FetchNewestBooksFailure(errorMessage: failure.errorMessage));
      },
      (booksList) {
        emit(FetchNewestBooksSuccess(books: booksList));
      },
    );
  }
}
