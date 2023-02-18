import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_description_body.dart';
import 'package:flutter/material.dart';

class BooKDescriptionView extends StatelessWidget {
  const BooKDescriptionView({Key? key, required this.booksModel}) : super(key: key);
final BooksModel booksModel;
  //صورة كبيرة
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BookDescriptionBody(booksModel: booksModel));
  }
}
