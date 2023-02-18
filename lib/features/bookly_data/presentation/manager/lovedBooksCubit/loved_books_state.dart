part of 'loved_books_cubit.dart';

@immutable
abstract class LovedBooksState {}

class LovedBooksInitial extends LovedBooksState {}
class LovedBooksLoading extends LovedBooksState {}
class LovedBooksSuccess extends LovedBooksState {
  final List<BooksModel>books;

  LovedBooksSuccess(this.books);
}
class LovedBooksFailure extends LovedBooksState {

  final String errMessege;

  LovedBooksFailure(this.errMessege);

}
