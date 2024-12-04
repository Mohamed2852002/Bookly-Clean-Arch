import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorMessageWidget extends StatelessWidget {
  const CustomErrorMessageWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Styles.textStyle16,
        textAlign: TextAlign.center,
      ),
    );
  }
}
