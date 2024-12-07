import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

void saveBooksData(List<BookEntity> books,String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
