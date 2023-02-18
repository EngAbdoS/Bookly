import 'package:bookly/features/bookly_data/presentation/views/widgets/loved_books_body.dart';
import 'package:flutter/material.dart';

//import '../../../../core/utils/dimentions.dart';
import '../../../../core/widgets/custom_app_bar.dart';
class SavedBooksView extends StatelessWidget {
  const SavedBooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
       child: Column(

         
         
         children: const [
           Padding(
             padding: EdgeInsets.only(
                 top: 45,
                 left: 30,
                 right: 30),
             child: CustomAppBar(),
           ),

           Padding(
             padding:  EdgeInsets.all(30),
             child: LovedBooksBody(),
           )
         ],
       ),
     ),


    );
  }
}
