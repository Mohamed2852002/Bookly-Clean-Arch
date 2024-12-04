import 'package:bookly_clean_arch/core/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:bookly_clean_arch/features/search/presentation/views/search_view.dart';
import 'package:bookly_clean_arch/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kHomeView = '/home';
  static const kBookDetailsView = '/details';
  static const kSearchView = '/search';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) =>  BookDetailsView(bookModel: state.extra as BookModel),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
