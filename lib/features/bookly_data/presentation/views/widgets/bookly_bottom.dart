

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/constans.dart';
//import '../../../../../core/utils/dimentions.dart';
import '../../../../../core/utils/styles.dart';

class BooklyBottom extends StatelessWidget {
  const BooklyBottom({Key? key, required this.route, required this.name}) : super(key: key);
  final String route;
  final String name;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: GestureDetector(
        onTap: ()=>GoRouter.of(context).push('/$route'),
        child: Container(
          width: double.maxFinite,

          decoration: BoxDecoration(
              color: KSecondColor,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Text(
            name,
            style: Styles.textStyle18.copyWith(color: Colors.white),
          ),),
      ),
    );
  }
}
