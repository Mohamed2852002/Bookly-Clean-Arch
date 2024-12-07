import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.fetchNewestBooksUseCase) : super(FetchNewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    var data = await fetchNewestBooksUseCase.call();
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
