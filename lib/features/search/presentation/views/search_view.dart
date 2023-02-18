import 'package:bookly/core/utils/APIService.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/serviceLocator.dart';
import '../../../home/data/repos/homeRepoImpl.dart';
import '../manager/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>SearchCubit(getIt.get<HomeRepoImpl>()),
    child:  const Scaffold(
        body:SafeArea(child: SearchViewBody()),
    ),
    );
  }
}
