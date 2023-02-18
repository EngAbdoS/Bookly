part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksLoading extends SimilarBooksState {}
class SimilarBooksSuccess extends SimilarBooksState {
  final List<BooksModel>books;

  SimilarBooksSuccess(this.books);
}
class SimilarBooksFailure extends SimilarBooksState {
  final String errMessegr;

  SimilarBooksFailure(this.errMessegr);
}
