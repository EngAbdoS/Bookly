import 'dart:math';

import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/APIService.dart';
import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:bookly/features/home/data/repos/homeRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constans.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks() async {

    List<BooksModel> books = [];
    Set draft = <String>{};

    try {
      for (var i in Coputer_words) {
        var data =
            await apiService.get(endpoint: 'volumes?Filtering=free-ebooks&q=$i'
                //'volumes?Filtering=free-ebooks&q=subject:programming'

                );
        //  print("iteeeeeeeeeeeeeeeems ${data["items"].length}"); //##########################################################
        for (var item in data['items']) {
          //print(item["volumeInfo"][ "title"]);
          if (draft.contains(item["volumeInfo"]["title"]) == false&&item["volumeInfo"]["title"]!=null) {
            books.add(BooksModel.fromJson(item));
            // print(item["volumeInfo"][ "title"]);
            draft.add(item["volumeInfo"]["title"]);
          }
        }
        // return right(books);
      }
      print("doubled ${draft.length}");
      print("iteeeeeeeeeeeeeeeems ${Coputer_words.length * 10}");
      books.shuffle();
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchNewestBooks() async {
    try {

      popular_words.shuffle();
      var data = await apiService.get(
          endpoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=${popular_words[0]}');

      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }
      //  print (books.last);
      books.shuffle();

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchSimilarBooks(
      {required category}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category');

      List<BooksModel> books = [];
      for (var item in data['items']) {
        books.add(BooksModel.fromJson(item));
      }
      books.shuffle();
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }



  @override
  Future<Either<Failure, List<BooksModel>>> fetchSearchedBooks ({required searchString})async {

    List<BooksModel> result = [];
    try {
      var data = await apiService.get(
          endpoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$searchString');
      for (var item in data['items']) {
        result.add(BooksModel.fromJson(item));
      }
       data = await apiService.get(
          endpoint:
          'volumes?Filtering=free-ebooks&q=$searchString');
      for (var item in data['items']) {
        result.add(BooksModel.fromJson(item));
      }

     // result.shuffle();
      return right(result);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }


  }
////////////////////////////////////////////////////////////////////////////////////////////////////////




  @override
  void shuffle([Random? random]) {}
}
