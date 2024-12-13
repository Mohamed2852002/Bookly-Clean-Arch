import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBooksListView extends StatelessWidget {
  const CustomBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      height: 225,
      child: ListView.separated(
        padding: REdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            CustomListViewItem(bookEntity: books[index]),
        separatorBuilder: (context, index) => const RSizedBox(width: 12),
        itemCount: books.length,
      ),
    );
  }
}
