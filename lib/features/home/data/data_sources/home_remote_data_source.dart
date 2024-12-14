import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/core/utils/api_service.dart';
import 'package:bookly_clean_arch/core/utils/constants.dart';
import 'package:bookly_clean_arch/core/utils/functions/save_books_data.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchRelatedBooks({required String categoryName});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        'volumes?q=food&Filtering=free-ebooks&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService
        .get('volumes?q=programming&Filtering=free-ebooks&Sorting=newest');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchRelatedBooks(
      {required String categoryName}) async {
    var data = await apiService
        .get('volumes?Filtering=free-ebooks&Sorting=relevance&q=$categoryName');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kRelatedBooks);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data["items"]) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
