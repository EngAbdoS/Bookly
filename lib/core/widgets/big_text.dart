import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constans.dart';
//import '../utils/dimentions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  final double size;
  TextOverflow overflow;

  BigText( {
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.fade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: overflow,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: size == 0 ?20 : size,

        ));
  }
}
