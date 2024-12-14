import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/use_cases/use_case.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

class FetchBooksUseCase implements UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) {
    // Put your permission check here
    return homeRepo.fetchBooks(pageNumber: pageNumber);
  }
}
