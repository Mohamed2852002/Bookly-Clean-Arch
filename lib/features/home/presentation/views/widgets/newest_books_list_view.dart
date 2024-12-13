import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_list_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: REdgeInsets.only(
        left: 30,
        right: 45,
        bottom: 16,
      ),
      sliver: SliverList.separated(
        separatorBuilder: (context, index) => const RSizedBox(height: 16),
        itemCount: books.length,
        itemBuilder: (context, index) => CustomBookListItem(
          bookEntity: books[index],
        ),
      ),
    );
  }
}
