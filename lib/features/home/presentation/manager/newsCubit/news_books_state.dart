part of 'news_books_cubit.dart';

@immutable
abstract class NewsBooksState {


  @override
  List<Object>get props=>[];
}

class NewsBooksInitial extends NewsBooksState {}
class NewsBooksLoading extends NewsBooksState {}
class NewsBooksSuccess extends NewsBooksState {
  final List<BooksModel>books;

  NewsBooksSuccess(this.books);

}
class NewsBooksFailure extends NewsBooksState {
  final String errMessage;

  NewsBooksFailure(this.errMessage);
}
