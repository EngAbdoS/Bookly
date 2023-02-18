import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:bookly/features/home/data/repos/homeRepo.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;
bool loaded=false;
  Future<void> fetchFeatureBooks() async {
    print("fetch");
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    //print(result);
    result.fold((failure) => emit(FeaturedBooksFailer(failure.errMessage)),
        (books) => emit(FeaturedBooksSuccess(books)));
    loaded=true;
  }
}
