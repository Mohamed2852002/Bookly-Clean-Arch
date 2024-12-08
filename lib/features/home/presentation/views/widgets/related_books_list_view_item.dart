import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/core/utils/constants.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RelatedBooksListViewItem extends StatelessWidget {
  const RelatedBooksListViewItem({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookEntity);
      },
      child: CustomBookImage(
        radius: 10,
        width: 70,
        height: 110,
        image: bookEntity.image ?? kNotFoundImage,
      ),
    );
  }
}
