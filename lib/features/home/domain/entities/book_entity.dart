class BookEntity {
  final String? image;
  final String? title;
  final String? authorName;
  final num? rating;
  final num? ratingCount;

  const BookEntity(
      {required this.image,
      required this.title,
      required this.authorName,
      required this.rating,
      required this.ratingCount});
}
