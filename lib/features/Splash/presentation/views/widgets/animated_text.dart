import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:bookly/core/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
      child: DefaultTextStyle(
        style:  const TextStyle(
          fontSize: 30,
          fontFamily: 'Agne',
          fontStyle: FontStyle.italic
        ),
        child: Center(
          child: AnimatedTextKit(
       isRepeatingAnimation: false,
            pause: const Duration(seconds: 1),
          //  onFinished: (){
          //    GoRouter.of(context).pushReplacement('/homeView');
          //  },
            animatedTexts: [
              TypewriterAnimatedText('Dozens of free book'),
              TypewriterAnimatedText('in your hands'),
              TypewriterAnimatedText('programming related or not'),
              TypewriterAnimatedText('It\'s all yours'),
              TypewriterAnimatedText('To enjoy reading ❤'),
            ],

          ),
        ),
      ),
    );
  }
}




