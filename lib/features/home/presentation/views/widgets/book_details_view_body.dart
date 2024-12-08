import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/related_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomBookDetailsAppBar(),
              const RSizedBox(height: 24),
              BookDetailsSection(bookEntity: bookEntity),
              const RSizedBox(height: 40),
              const RelatedBooksSection(),
              const RSizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
