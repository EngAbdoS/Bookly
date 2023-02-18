
import 'package:bookly/features/bookly_data/presentation/views/widgets/bookly_bottom.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';
//import '../../../../core/utils/dimentions.dart';

class BooklyView extends StatelessWidget {
  const BooklyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //image
      //home
      //saved
      //meta data
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 40, vertical:60),
        child: SizedBox(
          // color: Colors.white,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetsData.logoImage2,
                width: MediaQuery.of(context).size.width.toInt()*0.9,
              ),
              const SizedBox(height: 60,),
              const BooklyBottom(route:'homeView' ,name: 'Home',),
              const SizedBox(height:30,),
              const BooklyBottom(route:'lovedBooksView' ,name: 'Loved Books',),const SizedBox(height: 30,),
              const BooklyBottom(route:'metaDataView' ,name: 'About Developer',),

            ],
          ),
        ),
      ),
    );
  }
}

