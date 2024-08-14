import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/search/data/repo/search_repo_impl.dart';
import '../../Features/search/presentation/manager/search_cubit/search_book_cubit.dart';
import '../../Features/splash/presentation/views/splash_view.dart';
import '../models/book_model.dart';


abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(
            seconds: 1,
          ),
          child: const HomeView(),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0, 1.5),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc)
                    .animate(animation),
                child: child,
              ),
            );
          },
        );
      },
    ),
    GoRoute(
      path: kBookDetailsView,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(
            milliseconds: 450,
          ),
          child: BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(
              bookModel: state.extra as Items,
            ),
          ),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1.5, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: kSearchView,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionDuration: const Duration(
            milliseconds: 150,
          ),
          child: BlocProvider(
            create: (BuildContext context) => SearchBooksCubit(getIt.get<SearchRepoImpl>()),
            child: const SearchView(),
          ),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
              CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    )
  ]);
}
