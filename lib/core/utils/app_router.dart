import 'package:bookly/core/utils/serviceLocator.dart';
import 'package:bookly/features/Splash/presentation/views/animated_text_view.dart';
import 'package:bookly/features/bookly_data/data/repos/bookly_repo_impl.dart';
import 'package:bookly/features/bookly_data/presentation/manager/lovedBooksCubit/loved_books_cubit.dart';
import 'package:bookly/features/bookly_data/presentation/views/bookly_view.dart';
import 'package:bookly/features/bookly_data/presentation/views/meta_data_view.dart';
import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_description_body.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/Splash/presentation/views/SplashView.dart';
import '../../features/bookly_data/presentation/views/saved_books_view.dart';
import '../../features/home/data/repos/homeRepoImpl.dart';
import '../../features/home/presentation/views/book_description_view.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import 'APIService.dart';

abstract class AppRouter {
  static final route = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
      path: '/animatedTextView',
      builder: (context, state) => const AnimatedTextView(),
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionDuration: const Duration(milliseconds: 200),
        key: state.pageKey,
        child: const AnimatedTextView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/homeView',
      builder: (context, state) => const HomeView(),
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionDuration: const Duration(milliseconds: 300),
        key: state.pageKey,
        child: const HomeView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/bookDetailsView',
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
        child: BookDetailsView(
          booksModel: state.extra as BooksModel,
        ),
      ),
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionDuration: const Duration(milliseconds: 200),
        key: state.pageKey,
        child: BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            booksModel: state.extra as BooksModel,
          ),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/searchView',
      builder: (context, state) => const SearchView(),
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionDuration: const Duration(milliseconds: 200),
        key: state.pageKey,
        child: const SearchView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/bookDescriptionView',
      builder: (context, state) =>
          BooKDescriptionView(booksModel: state.extra as BooksModel),
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionDuration: const Duration(milliseconds: 200),
        key: state.pageKey,
        child: BooKDescriptionView(booksModel: state.extra as BooksModel),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/booklyView',
      builder: (context, state) => const BooklyView(),
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionDuration: const Duration(milliseconds: 200),
        key: state.pageKey,
        child: const BooklyView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/lovedBooksView',
      builder: (context, state)=> SavedBooksView(),
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionDuration: const Duration(milliseconds: 200),
        key: state.pageKey,
        child:  SavedBooksView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/metaDataView',
      builder: (context, state) => const MetaDataView(),
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionDuration: const Duration(milliseconds: 200),
        key: state.pageKey,
        child: const MetaDataView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
  ]);
}
