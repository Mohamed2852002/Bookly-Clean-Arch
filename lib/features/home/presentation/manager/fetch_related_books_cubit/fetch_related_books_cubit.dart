import 'package:bookly_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_related_books_cubit/fetch_related_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchRelatedBooksCubit extends Cubit<FetchRelatedBooksState> {
  FetchRelatedBooksCubit() : super(FetchRelatedBooksInitial());
  fetchRelevantBooks({required String category}) async {
    emit(FetchRelatedBooksLoading());
    var data = await HomeRepoImpl().fetchRelatedBooks(category: category);
    data.fold(
      (failure) {
        emit(FetchRelatedBooksFailure(errorMessage: failure.errorMessage));
      },
      (booksList) {
        emit(FetchRelatedBooksSuccess(books: booksList));
      },
    );
  }
}
