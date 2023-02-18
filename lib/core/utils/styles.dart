import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'dimentions.dart';

abstract class Styles {
  static TextStyle textStyle18 =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

  static TextStyle textStyle20 = GoogleFonts.chivo(
      fontSize: 20, fontWeight: FontWeight.normal);
  static TextStyle textStyle30 = GoogleFonts.chivo(
      fontSize:20 * 1.5, fontWeight: FontWeight.bold);
  static TextStyle textStyle14 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal);
  static TextStyle textStyle16 =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
}
