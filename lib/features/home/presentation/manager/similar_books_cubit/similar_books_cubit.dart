import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/homeRepo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());


  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) => emit(SimilarBooksFailure(failure.errMessage)),
            (books) => emit(SimilarBooksSuccess(books)));
  }


}
