import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/booksModel.dart';
import '../../../data/repos/homeRepo.dart';

part 'news_books_state.dart';

class NewsBooksCubit extends Cubit<NewsBooksState> {
  NewsBooksCubit(this.homeRepo) : super(NewsBooksInitial());


  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewsBooksLoading());
    var result = await homeRepo.fetchNewestBooks();


    Future.delayed(const Duration(seconds: 7),(){
      result.fold((failure) => emit(NewsBooksFailure(failure.errMessage)),
              (books) => emit(NewsBooksSuccess(books)));
    });

  }
}
