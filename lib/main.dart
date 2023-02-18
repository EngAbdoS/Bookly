import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/constans.dart';
import 'package:bookly/core/utils/serviceLocator.dart';
import 'package:bookly/features/bookly_data/data/repos/bookly_repo_impl.dart';
import 'package:bookly/features/bookly_data/presentation/manager/lovedBooksCubit/loved_books_cubit.dart';
import 'package:bookly/features/home/data/repos/homeRepoImpl.dart';
import 'package:bookly/features/home/presentation/manager/feature_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/newsCubit/news_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchFeatureBooks()),
        BlocProvider(
            create: (context) =>
                NewsBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks()),
        BlocProvider(
            create: (context) => LovedBooksCubit(getIt.get<BooklyRepoImpl>())
              ..fetchLovedBooks()
              ..fetchLovedBooksTitels())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: KSecondColor,
            focusColor: KSecondColor,
          ),
          primaryColor: KSecondColor,
          focusColor: KSecondColor,
          primaryColorDark: KSecondColor,
          scaffoldBackgroundColor: KPrimaryClor,
          textTheme: KPrimaryTextTheme,
        ),
        routerConfig: AppRouter.route,
      ),
    );
  }
}
