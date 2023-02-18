import 'dart:math';

import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{

 Future<Either<Failure,List<BooksModel>>> fetchNewestBooks();
 Future<Either<Failure,List<BooksModel>>> fetchFeaturedBooks();
 Future<Either<Failure,List<BooksModel>>> fetchSimilarBooks({required category});
 Future<Either<Failure,List<BooksModel>>> fetchSearchedBooks({required searchString});




 void shuffle([Random? random]);
}