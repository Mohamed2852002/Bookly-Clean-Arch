import 'package:bookly_clean_arch/core/utils/constants.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchBooks();
  List<BookEntity> fetchRelatedBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBooks);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBooks);
    return box.values.toList();
  }
  
  @override
  List<BookEntity> fetchRelatedBooks() {
    var box = Hive.box<BookEntity>(kNewestBooks);
    return box.values.toList();
  }
}
