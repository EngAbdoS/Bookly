//import 'package:bookly/core/utils/dimentions.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:bookly/features/home/presentation/views/widgets/similer_books_list_view.dart';

import 'package:flutter/material.dart';

import '../../../../../core/widgets/PDF_Ava.dart';
import 'book_rating.dart';
import 'booksAction.dart';
import 'customBookDetailsAppBar.dart';
import 'featured_list_item.dart';

class BookDetialsBody extends StatelessWidget {
  const BookDetialsBody({Key? key, required this.booksModel}) : super(key: key);
  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 30),
            child: CustomBookDetailsAppBar(book: booksModel),
          ),
          SizedBox(
            width: 150,
            child: Container(
              decoration: const BoxDecoration(
                //color: KPrimaryClor,
                // color: Colors.deepOrange,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45

                    // Color(0xFFe8e8e8)
                    ,
                    offset: Offset(-2, 5),
                    blurRadius: 9.0,
                  ),
                ],
              ),
              child: CustomListViewItem(
                  imgUrl:
                      booksModel.volumeInfo?.imageLinks?.thumbnail.toString() ??
                          ''),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Text(
              booksModel.volumeInfo?.title.toString() ?? "",
              style: Styles.textStyle30,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Opacity(
              opacity: .7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(booksModel.volumeInfo?.authors?[0].toString() ?? "",
                    style:
                        Styles.textStyle18.copyWith(fontStyle: FontStyle.italic)),
              )),
          const SizedBox(
            height: 15,
          ),
          BookRating(
            rating: booksModel.volumeInfo?.averageRating?.round() ?? 0,
            count: booksModel.volumeInfo?.ratingsCount?.round() ?? 0,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 40),
              child: BooksAction(
                booksModel: booksModel,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "You can also like",
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
              height :180,child: SimilarBooksListView()),
        ],
      ),
    );
  }
}
