import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/home_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBooks(
      {int pageNumber = 0}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      List<BookEntity> books;
      if (!connectivityResult.contains(ConnectivityResult.mobile) ||
          !connectivityResult.contains(ConnectivityResult.wifi)) {
        books = homeLocalDataSource.fetchBooks(pageNumber: pageNumber);
        if (books.isNotEmpty) {
          return right(books);
        }
      }
      books = await homeRemoteDataSource.fetchBooks(pageNumber: pageNumber);
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchRelatedBooks(
      {required String category}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchRelatedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books =
          await homeRemoteDataSource.fetchRelatedBooks(categoryName: category);
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
  }
}
