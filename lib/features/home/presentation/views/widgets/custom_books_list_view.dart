import 'package:bookly_clean_arch/features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/fetch_books_cubit/fetch_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBooksListView extends StatefulWidget {
  const CustomBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<CustomBooksListView> createState() => _CustomBooksListViewState();
}

class _CustomBooksListViewState extends State<CustomBooksListView> {
  late final ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;
  scrollListener() async {
    double currentPosition = scrollController.position.pixels;
    double maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FetchBooksCubit>(context)
            .fetchBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollController.removeListener(scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      height: 225,
      child: ListView.separated(
        controller: scrollController,
        padding: REdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            CustomListViewItem(bookEntity: widget.books[index]),
        separatorBuilder: (context, index) => const RSizedBox(width: 12),
        itemCount: widget.books.length,
      ),
    );
  }
}
