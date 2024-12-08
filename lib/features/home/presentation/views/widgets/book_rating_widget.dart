import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookRatingWidget extends StatelessWidget {
  const BookRatingWidget({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: const Color(0xffFFDD4F),
          size: 20.r,
        ),
        const RSizedBox(width: 3),
        Text('${bookEntity.rating ?? 0}',
            style: Styles.textStyle16),
        const RSizedBox(width: 12),
        Text('(${bookEntity.ratingCount ?? 0})',
            style: Styles.textStyle14),
      ],
    );
  }
}
