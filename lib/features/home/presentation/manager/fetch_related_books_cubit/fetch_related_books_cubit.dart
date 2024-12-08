import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_related_books_use_case.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_related_books_cubit/fetch_related_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchRelatedBooksCubit extends Cubit<FetchRelatedBooksState> {
  FetchRelatedBooksCubit(this.fetchRelatedBooksUseCase)
      : super(FetchRelatedBooksInitial());
  final FetchRelatedBooksUseCase fetchRelatedBooksUseCase;
  fetchRelevantBooks({required String category}) async {
    emit(FetchRelatedBooksLoading());
    var data = await fetchRelatedBooksUseCase.call(category);
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
