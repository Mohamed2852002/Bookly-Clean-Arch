import 'package:hive_flutter/hive_flutter.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 1)
class BookEntity extends HiveObject {
  @HiveField(0)
  final String? image;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? authorName;

  @HiveField(3)
  final num? rating;

  @HiveField(4)
  final num? ratingCount;

  @HiveField(5)
  final String? bookId;

  @HiveField(6)
  final String? category;

  @HiveField(7)
  final String? bookUrl;

  BookEntity({
    required this.image,
    required this.title,
    required this.authorName,
    required this.rating,
    required this.ratingCount,
    required this.bookId,
    required this.category,
    required this.bookUrl,
  });
}
