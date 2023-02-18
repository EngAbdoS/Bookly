import 'package:bookly/core/utils/APIService.dart';
import 'package:bookly/features/bookly_data/data/repos/bookly_repo_impl.dart';
import 'package:bookly/features/home/data/repos/homeRepoImpl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<BooklyRepoImpl>(BooklyRepoImpl());

}
