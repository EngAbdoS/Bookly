part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}
class SearchBooksSuccess extends SearchState {
  final List<BooksModel>books;

  SearchBooksSuccess(this.books);


}
class SearchBooksFailure extends SearchState {
  final String errMessegr;

  SearchBooksFailure(this.errMessegr);
}
