import 'package:bookly_clean_arch/core/utils/constants.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

void saveBooksData(List<BookEntity> books) {
    var box = Hive.box<BookEntity>(kDataBaseBox);
    box.addAll(books);
  }