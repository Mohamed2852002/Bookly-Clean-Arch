import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookRatingWidget extends StatelessWidget {
  const BookRatingWidget({super.key, required this.bookModel});
  final BookModel bookModel;
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
        Text('${bookModel.volumeInfo?.averageRating ?? 0}',
            style: Styles.textStyle16),
        const RSizedBox(width: 12),
        Text('(${bookModel.volumeInfo?.ratingsCount ?? 0})',
            style: Styles.textStyle14),
      ],
    );
  }
}
