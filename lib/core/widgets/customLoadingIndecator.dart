import 'package:flutter/material.dart';
class CustomLoadingIndecator extends StatelessWidget {
  const CustomLoadingIndecator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(),);
  }
}
