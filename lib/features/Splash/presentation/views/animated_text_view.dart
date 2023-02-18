import 'package:bookly/features/Splash/presentation/views/widgets/animated_text.dart';
import 'package:flutter/material.dart';


class AnimatedTextView extends StatelessWidget {
  const AnimatedTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
body: AnimatedText(),



    );
  }
}
