import 'package:flutter/material.dart';

class Buttom_Shadow extends StatelessWidget {
  const Buttom_Shadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Align(
        alignment:Alignment.bottomCenter,child: Container(
width: double.maxFinite,
      height: 60,
      decoration: const BoxDecoration(

        //color: KPrimaryClor,
        boxShadow: [
          BoxShadow(
              color: Colors.black45

              // Color(0xFFe8e8e8)
              ,
              offset: Offset(0, 20),
              blurRadius: 25.0,
              blurStyle: BlurStyle.normal
          ),
        ],

      ),

    ));
  }
}
