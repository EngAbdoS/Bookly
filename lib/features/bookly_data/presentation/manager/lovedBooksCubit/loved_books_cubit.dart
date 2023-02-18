import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/booksModel.dart';
import '../../../data/repos/bookly_repo_impl.dart';

part 'loved_books_state.dart';

class LovedBooksCubit extends Cubit<LovedBooksState> {
  final BooklyRepoImpl booklyRepoImpl;

  LovedBooksCubit(this.booklyRepoImpl) : super(LovedBooksInitial());
  late BooksModel opBookk;
  List<String> titels = [];

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    if (isLiked) {
      removeFromLoved(opBookk);
    } else {
      addToLoved(opBookk);
    }

    return !isLiked;
  }
  void setBook(BooksModel opBook) {
    opBookk = opBook;
    fetchLovedBooksTitels();
  }


  void addToLoved(BooksModel book) {
    booklyRepoImpl.addToLovedList(book: book);
    fetchLovedBooks();
    fetchLovedBooksTitels();
  }

  void removeFromLoved(BooksModel book) {
    booklyRepoImpl.removeFromLovedList(book: book);
    fetchLovedBooks();
    fetchLovedBooksTitels();
  }

  Future<void> fetchLovedBooks() async {
    emit(LovedBooksLoading());
    var books = await booklyRepoImpl.fetchLovedBooks();

    books.fold((failure) => emit(LovedBooksFailure(failure.errMessage)),
        (books) => emit(LovedBooksSuccess(books)));
  }

  Future<void> fetchLovedBooksTitels() async {
    var booksTitels = await booklyRepoImpl.fetchLovedBooksTitels();
    titels = booksTitels;
  }
}
