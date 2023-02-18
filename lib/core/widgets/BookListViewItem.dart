import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/widgets/book_rating.dart';
import '../../features/home/presentation/views/widgets/featured_list_item.dart';

import '../utils/styles.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key, required this.booksModel})
      : super(key: key);
  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push('/bookDetailsView',extra: booksModel),
      child: SizedBox(
        height: 135,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: CustomListViewItem(imgUrl:booksModel.volumeInfo?.imageLinks?.thumbnail??"",)
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                  booksModel.volumeInfo?.title.toString()??"",
                    style: Styles.textStyle20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text(
                       booksModel.volumeInfo?.authors?[0].toString()??"",
                      style: Styles.textStyle14
                          .copyWith(color: const Color(0xff707070)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),

                      BookRating(
                        rating:booksModel.volumeInfo?.averageRating?.round()??0 ,
                        count: booksModel.volumeInfo?.ratingsCount?.round()??0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
