
import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import '../../features/bookly_data/presentation/manager/lovedBooksCubit/loved_books_cubit.dart';


class LovrIconeAnimation extends StatefulWidget {
  LovrIconeAnimation({Key? key, required this.book}) : super(key: key);
  final BooksModel book;

  @override
  State<LovrIconeAnimation> createState() => _LovrIconeAnimationState();
}

class _LovrIconeAnimationState extends State<LovrIconeAnimation> {

@override
  void initState() {
  BlocProvider.of<LovedBooksCubit>(context).setBook(widget.book);    super.initState();
  }

  @override
  Widget build(BuildContext context) {

        var x = BlocProvider.of<LovedBooksCubit>(context);
        return LikeButton(
          isLiked: (x.titels.contains(widget.book.volumeInfo!.title.toString()))?true:false,
          onTap: x.onLikeButtonTapped,
          size:32,
        );


  }
}
