
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../utils/constans.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.erroeMessage})
      : super(key: key);
  final String erroeMessage;

  @override
  Widget build(BuildContext context) {
    var errorSnakBar = SnackBar(
      shape: StadiumBorder(),
      content: Text(
        erroeMessage,
        style: Styles.textStyle18,
      ),
      backgroundColor: KSecondColor,
    );

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: KSecondColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              erroeMessage,
              style: Styles.textStyle18,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
    );
  }
}
