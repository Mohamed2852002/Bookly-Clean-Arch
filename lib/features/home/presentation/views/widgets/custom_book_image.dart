import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.radius,
  });
  final double width;
  final double height;
  final double radius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        radius.r,
      ),
      child: CachedNetworkImage(
        imageUrl: image,
        width: width.w,
        height: height.h,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Icon(Icons.error, size: 35.sp),
      ),
    );
  }
}
