import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/assets.dart';
//import '../../../core/utils/dimentions.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
GoRouter.of(context).push('/booklyView');


          },
          child: Image.asset(

            AssetsData.logoImage,
            width: 120,
          ),
        ),
        IconButton(
            onPressed: () => GoRouter.of(context).push('/searchView'),
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size:32,
            )),
      ],
    );
  }
}
