

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import '../../../../../../core/utils/dimentions.dart';
import '../../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({Key? key, required this.rating, required this.count}) : super(key: key);
final int? rating;

final int? count;
  @override
  Widget build(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        const SizedBox(
          width:9,
        ),
        Text(
          (rating??0).toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width:5,
        ),
        Opacity(opacity: .5,
          child: Text(
            "(${count??0})",
            style: Styles.textStyle14
          ),
        ),
      ],
    );
  }
}
