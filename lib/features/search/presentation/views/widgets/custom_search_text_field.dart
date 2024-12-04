import 'package:bookly_clean_arch/features/search/presentation/manager/search_result_books_cubit/search_result_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        BlocProvider.of<SearchResultBooksCubit>(context)
            .getSearchedBooks(bookName: value);
      },
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: 'Search Books',
        suffixIcon: Opacity(
          opacity: 0.7,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ),
      ),
    );
  }
}
