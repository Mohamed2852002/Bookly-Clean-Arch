import 'package:bookly_clean_arch/core/utils/constants.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchBooks({int pageNumber = 0});
  List<BookEntity> fetchRelatedBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = startIndex + 10;
    var box = Hive.box<BookEntity>(kFeaturedBooks);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBooks);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchRelatedBooks() {
    var box = Hive.box<BookEntity>(kRelatedBooks);
    return box.values.toList();
  }
}
