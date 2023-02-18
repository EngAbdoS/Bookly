import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/constans.dart';
import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'bookly_repo.dart';

class BooklyRepoImpl implements BoolkyRepo {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  BooklyRepoImpl();

  List<String> lovedList = [];
  List<String> lovedListTitles = [];

  @override
  void addToLovedList({required BooksModel book}) async {
    final SharedPreferences prefs = await _prefs;

    if (prefs.containsKey(LovedList) && prefs.containsKey(LovedListTitels)) {
      lovedList = prefs.getStringList(LovedList)!;
      lovedListTitles = prefs.getStringList(LovedListTitels)!;
    }
    String encodedBook = json.encode(book);

    lovedList.add(encodedBook);
    lovedListTitles.add(book.volumeInfo!.title.toString());

    prefs.setStringList(LovedList, lovedList);
    prefs.setStringList(LovedListTitels, lovedListTitles);

    lovedList = [];
    lovedListTitles = [];

  }

  @override
  void removeFromLovedList({required BooksModel book}) async {
    final SharedPreferences prefs = await _prefs;

    lovedList = prefs.getStringList(LovedList)!;
    lovedListTitles = prefs.getStringList(LovedListTitels)!;

    List<String> draft = [];
    lovedListTitles.remove(book.volumeInfo!.title.toString());
    //print(lovedListTitles);
    String delItem = jsonEncode(book);
    for (var i in lovedList) {
      if (i != delItem) draft.add(i);
    }
    prefs.setStringList(LovedList, draft);
    prefs.setStringList(LovedListTitels, lovedListTitles);

    lovedList = [];
    lovedListTitles = [];

  }

  //
  // @override
  // Future<List<BooksModel>> getAllLovedList() async {
  //   List<BooksModel>books=[];
  //   final SharedPreferences prefs = await _prefs;
  //   if (prefs.containsKey(LovedList)) {
  //     lovedList = prefs.getStringList(LovedList)!;
  //   } else {
  //   }
  //  for(var i in lovedList)
  //    {
  //      books.add(BooksModel.fromJson(jsonDecode(i)));
  //    }
  //  return books;
  // }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchLovedBooks() async {
    final SharedPreferences prefs = await _prefs;
    List<BooksModel> books = [];

    try {
      final SharedPreferences prefs = await _prefs;
      if (prefs.containsKey(LovedList)) {
        lovedList = prefs.getStringList(LovedList)!;
      }
      for (var i in lovedList.reversed) {
        books.add(BooksModel.fromJson(jsonDecode(i)));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<List<String>> fetchLovedBooksTitels() async {

    final SharedPreferences prefs = await _prefs;
    if (prefs.containsKey(LovedListTitels)) {
      lovedListTitles = prefs.getStringList(LovedListTitels)!;
    }

    return lovedListTitles;
  }
}
