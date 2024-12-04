import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/core/utils/app_router.dart';
import 'package:bookly_clean_arch/core/utils/constants.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/book_info_widget.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomBookListItem extends StatelessWidget {
  const CustomBookListItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomBookImage(
            width: 75,
            height: 110,
            radius: 10,
            image:
                bookModel.volumeInfo?.imageLinks?.thumbnail ?? kNotFoundImage,
          ),
          const RSizedBox(width: 30),
          BookInfoWidget(bookModel: bookModel),
        ],
      ),
    );
  }
}
