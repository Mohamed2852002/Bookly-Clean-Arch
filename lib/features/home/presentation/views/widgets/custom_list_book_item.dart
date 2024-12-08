import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/core/utils/constants.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_info_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomBookListItem extends StatelessWidget {
  const CustomBookListItem({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookEntity);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomBookImage(
            width: 75,
            height: 110,
            radius: 10,
            image:
                bookEntity.image ?? kNotFoundImage,
          ),
          const RSizedBox(width: 30),
          BookInfoWidget(bookEntity: bookEntity),
        ],
      ),
    );
  }
}
