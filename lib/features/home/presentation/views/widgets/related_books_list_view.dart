import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/related_books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedBooksListView extends StatelessWidget {
  const RelatedBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      height: 110,
      child: ListView.separated(
        padding: REdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            RelatedBooksListViewItem(bookEntity: books[index]),
        itemCount: books.length,
        separatorBuilder: (context, index) => const RSizedBox(width: 10),
      ),
    );
  }
}
