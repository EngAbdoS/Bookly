import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bookly/core/utils/constans.dart';
//import 'package:bookly/core/utils/dimentions.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';



class  SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateToHome(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: TextLiquidFill(

          loadUntil: 1,
          text: 'BOOKLY',
          waveColor: KSecondColor,
          boxBackgroundColor: KPrimaryClor,
          textStyle:
          GoogleFonts.sonsieOne(fontSize:MediaQuery.of(context).size.width.toInt()*.128,
              fontWeight: FontWeight.w900

          ),
          //boxHeight:400,
        ),
      ),
    );
  }


void navigateToHome(BuildContext context) {

Future.delayed(const Duration(seconds: 6),(){
GoRouter.of(context).pushReplacement('/homeView');




});
}
  }

