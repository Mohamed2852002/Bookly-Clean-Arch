import 'package:bookly_clean_arch/features/search/presentation/manager/search_result_books_cubit/search_result_books_cubit.dart';
import 'package:bookly_clean_arch/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchResultBooksCubit(),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
