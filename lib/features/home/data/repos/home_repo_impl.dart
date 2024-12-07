import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/core/utils/api_service.dart';
import 'package:bookly_clean_arch/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = HomeLocalDataSourceImpl().fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await HomeRemoteDataSourceImpl().fetchNewestBooks();
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBooks() async {
    try {
      List<BookEntity> books;
      books = HomeLocalDataSourceImpl().fetchBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await HomeRemoteDataSourceImpl().fetchBooks();
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchRelatedBooks(
      {required String category}) async {
    try {
      var data = await ApiService.get(
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=$category');
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }
}
