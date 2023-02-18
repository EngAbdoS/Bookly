import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constans.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
double height;

  SmallText({
    Key? key,
    this.color= const Color(0xFFccc7c5),
    required this.text,
    this.size = 12,
    this.height=1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:KChivo_monoFont.copyWith(fontSize: size,color: color)
    );
  }
}
