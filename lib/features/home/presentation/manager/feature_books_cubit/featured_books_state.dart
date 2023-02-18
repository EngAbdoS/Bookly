part of 'featured_books_cubit.dart';


abstract class FeaturedBooksState  {
  const FeaturedBooksState();
  @override
  List<Object> get props=>[];
}


class FeaturedBooksInitial extends FeaturedBooksState {}
class FeaturedBooksFailer extends FeaturedBooksState {
  final String errMessage;

  FeaturedBooksFailer(this.errMessage);
}
class FeaturedBooksSuccess extends FeaturedBooksState {

final List<BooksModel>books;

const  FeaturedBooksSuccess(this.books);

}
class FeaturedBooksLoading extends FeaturedBooksState {}
