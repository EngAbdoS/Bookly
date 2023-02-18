import 'package:bookly/features/bookly_data/presentation/manager/lovedBooksCubit/loved_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/customList.dart';
import '../../../../../core/widgets/custom_error_widget.dart';

class LovedBooksBody extends StatelessWidget {
  const LovedBooksBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  BlocProvider.of<LovedBooksCubit>(context).fetchLovedBooks();
    return BlocBuilder<LovedBooksCubit, LovedBooksState>(

      builder: (context, state) {
        if (state is LovedBooksSuccess) {
          // print(state.books.length);

          return  customList(text: "Loved books :",books: state.books,);
        } else if (state is LovedBooksFailure) {
          return CustomErrorWidget(erroeMessage: state.errMessege);
        } else {
          return  const CircularProgressIndicator();
        }
      },
    );
  }
}
