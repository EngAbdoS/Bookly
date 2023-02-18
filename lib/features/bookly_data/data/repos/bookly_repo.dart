import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/models/booksModel.dart';

abstract class BoolkyRepo
{

  void addToLovedList({required BooksModel book});
 // Future<List<BooksModel>>getAllLovedList();
  void removeFromLovedList({required BooksModel book});
  Future<Either<Failure,List<BooksModel>>> fetchLovedBooks();
  Future<List<String>> fetchLovedBooksTitels();






}