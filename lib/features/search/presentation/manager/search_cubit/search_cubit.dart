import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/booksModel.dart';
import '../../../../home/data/repos/homeRepo.dart';



part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());

bool have_data=false;


  final HomeRepo homeRepo;

  Future<void> fetchSearchedBooks({required String searchString}) async {
    emit(SearchLoading());
    var result = await homeRepo.fetchSearchedBooks(searchString: searchString);
    if(result.length()>4)have_data=true;
    result.fold((failure) => emit(SearchBooksFailure(failure.errMessage)),
            (books) => emit(SearchBooksSuccess(books)));



  }






}
