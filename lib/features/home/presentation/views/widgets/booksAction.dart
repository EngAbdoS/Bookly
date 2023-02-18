
import 'package:bookly/features/home/data/models/booksModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/PDF_Ava.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.booksModel}) : super(key: key);

  final BooksModel booksModel;

  //final String url;

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

    //  print("issss");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                )),
            onPressed: () {
              GoRouter.of(context)
                  .push('/bookDescriptionView', extra: booksModel);
            },
            child: Text(
              "Description",
              style: Styles.textStyle18.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Stack(alignment: Alignment.bottomRight,
          children: [
            SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffEF8262),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    )),
                onPressed: () async {
                  final Uri urls = Uri.parse(booksModel.volumeInfo!.previewLink!);

                  try {
                    await canLaunchUrl(urls);
                    await launchUrl(mode: LaunchMode.externalApplication, urls);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(errorSnakBar);
                  }
                },
                child: Text(
                  "Free Preview",
                  style: Styles.textStyle18.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize:16,
                  ),
                ),
              ),
            ),
            PDF_Ava(pdf: booksModel.accessInfo!.pdf?.isAvailable??false,)
          ],
        ),
      ],
    );
  }
}
