import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchBooks();
  List<BookEntity> fetchRelatedBooks({required String category});
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchBooks() {
    // TODO: implement fetchBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchRelatedBooks({required String category}) {
    // TODO: implement fetchRelatedBooks
    throw UnimplementedError();
  }
  
}
