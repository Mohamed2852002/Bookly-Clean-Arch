import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_related_books_cubit/fetch_related_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchRelatedBooksCubit extends Cubit<FetchRelatedBooksState> {
  FetchRelatedBooksCubit(this.homeRepo) : super(FetchRelatedBooksInitial());
  final HomeRepo homeRepo;
  fetchRelevantBooks({required String category}) async {
    emit(FetchRelatedBooksLoading());
    var data = await homeRepo.fetchRelatedBooks(category: category);
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
