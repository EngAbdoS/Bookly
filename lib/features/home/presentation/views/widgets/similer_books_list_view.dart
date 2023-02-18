import 'package:bookly/core/widgets/customLoadingIndecator.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

//import '../../../../../../core/utils/dimentions.dart';
import 'featured_list_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 20,bottom: 20,top: 15),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                     horizontal: 5,
                    ),
                    child: GestureDetector(
                      onTap: () => GoRouter.of(context).push(
                          '/bookDetailsView',
                          extra: state.books[index]),
                      child: CustomListViewItem(
                          imgUrl: state.books[index].volumeInfo?.imageLinks
                                  ?.thumbnail
                                  .toString() ??
                              ''),
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return const CustomErrorWidget(erroeMessage: "Oops !\nThis book have no similar books");
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
