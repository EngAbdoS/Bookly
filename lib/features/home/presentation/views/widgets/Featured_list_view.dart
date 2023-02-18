
import 'package:bookly/core/widgets/custom_error_widget.dart';

import 'package:bookly/features/home/presentation/manager/feature_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Splash/presentation/views/widgets/animated_text.dart';
import 'CustomSnapyListView.dart';


class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (contextt, state) {
      if (state is FeaturedBooksSuccess) {
        return SnapyList(
          itemState: state.books,
        );
      } else if (state is FeaturedBooksFailer) {
        return CustomErrorWidget(erroeMessage: state.errMessage);
      } else {
        return const AnimatedText();
          //const CustomLoadingIndecator();
      }
    });
  }
}
