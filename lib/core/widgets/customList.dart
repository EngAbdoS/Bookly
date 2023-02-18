
import 'package:flutter/cupertino.dart';

import '../../features/home/data/models/booksModel.dart';
//import '../utils/dimentions.dart';
import '../utils/styles.dart';
import 'BookListViewItem.dart';

class customList extends StatelessWidget {
  const customList({
    super.key, required this.books, required this.text,
  });
  final List<BooksModel>books;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            text,
            style: Styles.textStyle18,
          ),
        ),
        const SizedBox(height: 20,),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BookListViewItem(
                  booksModel: books[index],
                ),
              );
            }),

      ],
    );
  }
}
