import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/constants.dart';

class PriceAndRateWidget extends StatelessWidget {
  const PriceAndRateWidget({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      width: 300,
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Free',
              style: Styles.textStyle15.copyWith(
                color: Colors.black,
              ),
              onPressed: () {},
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              text: 'Preview',
              style: Styles.textStyle16,
              onPressed: () async {
                final Uri url = Uri.parse(
                    bookModel.volumeInfo?.previewLink ?? kNotFoundImage);
                await launchUrl(url, mode: LaunchMode.externalApplication);
              },
              backgroundColor: const Color(0xffEF8262),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.r),
                bottomRight: Radius.circular(15.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
