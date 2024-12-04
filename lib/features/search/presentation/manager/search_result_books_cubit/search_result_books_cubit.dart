import 'package:bookly_clean_arch/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_clean_arch/features/search/presentation/manager/search_result_books_cubit/search_result_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultBooksCubit extends Cubit<SearchResultBooksState> {
  SearchResultBooksCubit() : super(SearchResultBooksInitial());
  getSearchedBooks({required String bookName}) async {
    emit(SearchResultBooksLoading());
    var data = await SearchRepoImpl().getSearcheBooks(bookName: bookName);
    data.fold(
      (failure) {
        emit(SearchResultBooksFailure(errorMessage: failure.errorMessage));
      },
      (booksList) {
        emit(SearchResultBooksSuccess(books: booksList));
      },
    );
  }
}
