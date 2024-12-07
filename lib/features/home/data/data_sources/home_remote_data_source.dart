import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/core/utils/api_service.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchBooks();
  Future<List<BookEntity>> fetchRelatedBooks({required String category});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchBooks() async {
    var data = await ApiService.get('volumes?q=food&Filtering=free-ebooks');
    List<BookEntity> books = [];
    for (var item in data["items"]) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await ApiService.get(
        'volumes?q=programming&Filtering=free-ebooks&Sorting=newest');
    List<BookEntity> books = [];
    for (var item in data["items"]) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchRelatedBooks({required String category}) {
    // TODO: implement fetchRelatedBooks
    throw UnimplementedError();
  }
}
