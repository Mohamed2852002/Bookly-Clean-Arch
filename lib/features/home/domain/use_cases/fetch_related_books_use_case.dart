import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/use_cases/use_case.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchRelatedBooksUseCase implements UseCase<List<BookEntity>,String> {
   final HomeRepo homeRepo;

  FetchRelatedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([String categoryName = '']) {
    // Put your permission check here
    return homeRepo.fetchRelatedBooks(category: categoryName);
  }
}