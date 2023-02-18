import 'package:avatar_glow/avatar_glow.dart';
import 'package:bookly/core/utils/constans.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
class ProfileGlow extends StatelessWidget {
  const ProfileGlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      glowColor:KSecondColor,
      endRadius: 140,
      duration: const Duration(milliseconds: 2000),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: const Duration(milliseconds: 100),
      child: Material(     // Replace this child with your own
        elevation: 8.0,
        shadowColor: Colors.black,
        shape: const CircleBorder(

        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 0.1,
            ),
          ),
          child: CircleAvatar(

            backgroundColor: Colors.grey[100],
            radius: 80,
            child: Image.asset(
              AssetsData.profile,
              height: 500,
            ),
          ),
        ),
      ),
    );
  }
}
