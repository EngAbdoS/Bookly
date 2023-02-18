import 'package:bookly/core/widgets/PDF_Ava.dart';
import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/styles.dart';

import 'customBookDetailsAppBar.dart';
import 'expandaple_text.dart';
import 'featured_list_item.dart';

class BookDescriptionBody extends StatelessWidget {
  const BookDescriptionBody({Key? key, required this.booksModel})
      : super(key: key);

  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    var errorSnakBar = SnackBar(
      shape: const StadiumBorder(),
      content: Text(
        "Opps there is an error ...",
        style: Styles.textStyle18,
      ),
      backgroundColor: Colors.deepPurple,
    );
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 30, vertical:40),
            child:  CustomBookDetailsAppBar(book: booksModel),
          ),
          SizedBox(
            width:150,
            child: Container(
              decoration: const BoxDecoration(
                //color: KPrimaryClor,
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
              // maxLines: 2,
              //   overflow:TextOverflow.ellipsis ,
            ),
          ),
          const SizedBox(
            height:6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 25, vertical:30),
            child: ExpandableText(
              text: booksModel.volumeInfo?.description ??
                  "There is no description",
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 30),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  width: 225,
                  height:60,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffEF8262),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final Uri urls =
                          Uri.parse(booksModel.volumeInfo!.previewLink!);

                      try {
                        await canLaunchUrl(urls);
                        await launchUrl(
                            mode: LaunchMode.externalApplication, urls);
                      } catch (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(errorSnakBar);
                      }
                    },
                    child: Text(
                      "Free Preview",
                      style: Styles.textStyle18.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize:24,
                      ),
                    ),
                  ),
                ),
                PDF_Ava(pdf: booksModel.accessInfo?.pdf?.isAvailable??false,)
              ],
            ), /////////////////////////////////
          ),
        ],
      ),
    );
  }
}
