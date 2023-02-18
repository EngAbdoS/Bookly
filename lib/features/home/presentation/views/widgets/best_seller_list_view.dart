import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/manager/newsCubit/news_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/widgets/customList.dart';


class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBooksCubit, NewsBooksState>(
      builder: (context, state) {
        if (state is NewsBooksSuccess) {
         // print(state.books.length);



          return  customList(text: "Popular books :",books: state.books,);
        } else if (state is NewsBooksFailure) {
          return CustomErrorWidget(erroeMessage: state.errMessage);
        } else {
          return Container();
            //const CircularProgressIndicator();
        }
      },
    );
  }






}
