import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/BookListViewItem.dart';
import '../../manager/search_cubit/search_cubit.dart';
import 'customTextSerchField.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height:15,),
            CustomSearchTextFeild(),
            SizedBox(
              height: 30,
            ),
            SearchRuseltListView(),
          ],
        ),
      ),
    );
  }
}

class SearchRuseltListView extends StatelessWidget {
  const SearchRuseltListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Opacity(
              opacity: .7,
              child: SizedBox(
                  width:275,
                  child: Text(
                    "deer end user , you can search by book name or category 😊 ",
                    style: Styles.textStyle18.copyWith(
                        fontStyle: FontStyle.italic,
                        fontSize:10.8),
                  )));
        } else if (state is SearchBooksSuccess) {
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search Result :",
                    style: Styles.textStyle18,
                  ),
                  const SizedBox(
                    height:15,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: BookListViewItem(
                          booksModel: state.books[index],
                        ), //BookListViewItem(booksModel: null,),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        } else if (state is SearchBooksFailure) {
          return

            CustomErrorWidget(erroeMessage: state.errMessegr);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
