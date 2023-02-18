//import 'package:bookly/core/utils/dimentions.dart';
import 'package:bookly/features/bookly_data/presentation/views/widgets/profileGlow.dart';
import 'package:bookly/features/bookly_data/presentation/views/widgets/socialBox.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
class MetaDataBody extends StatelessWidget {
  const MetaDataBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(padding:  const EdgeInsets.symmetric(
          horizontal: 40, vertical:60),child: SizedBox(
        // color: Colors.white,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsData.logoImage2,
              width: MediaQuery.of(context).size.width.toInt()*0.9,
            ),
            //SizedBox(height: Dimentions.height10,),
            const ProfileGlow(),
            const SocialBox(),
          ],
        ),
      ),),
    );
  }
}
