

import 'package:flutter/material.dart';

import '../utils/styles.dart';

class PDF_Ava extends StatelessWidget {
  const PDF_Ava({Key? key, required this.pdf}) : super(key: key);
  final bool pdf;
  @override
  Widget build(BuildContext context) {
    if (pdf )
    {  return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        "pdf",
        style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w400,fontSize: 8,color: Colors.white),
      ),
    );}
    else{
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          "",
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w400,fontSize: 8,color: Colors.white),
        ),
      );}
  }
}




