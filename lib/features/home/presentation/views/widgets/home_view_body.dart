//import 'package:bookly/core/utils/dimentions.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/buttom_shadow.dart';
import 'Featured_list_view.dart';
import 'best_seller_list_view.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                        top:45,
                        left: 30,
                        right: 30),
                    child: CustomAppBar(),
                  ),

                  FeaturedBooksListView(),
                  //SizedBox(height: Dimentions.height60,),


                  //
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 30, right:45,bottom:30),
                child:  BestSellerListView(),
              ),
            )
          ],
        ),
        const Buttom_Shadow(),
      ],
    );
  }
}
