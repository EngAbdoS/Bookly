
import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//import '../../../../../core/utils/dimentions.dart';
import '../../../../../core/widgets/love_icon_animation.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({Key? key, required this.book}) : super(key: key);
final BooksModel book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
          GoRouter.of(context).pushReplacement('/homeView');
        }, icon: const Icon(Icons.close,size:32,color: Colors.grey ,)),
        LovrIconeAnimation(
book: book,
        ),

      ],
    );
  }
}
