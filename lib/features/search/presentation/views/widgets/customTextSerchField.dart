import 'package:bookly/core/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../manager/search_cubit/search_cubit.dart';

class CustomSearchTextFeild extends StatelessWidget {
  const CustomSearchTextFeild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var x=BlocProvider.of<SearchCubit>(context);

    return TextField(
      textInputAction: TextInputAction.search,
      cursorColor: KSecondColor,

      decoration: InputDecoration(
fillColor: KSecondColor,
        hoverColor: KSecondColor,
        focusColor: KSecondColor,
        //fillColor: Colors.white
        //  ,filled: true,
          errorBorder: BuildOutlinedInputBorde().copyWith(borderSide: const BorderSide(color: Colors.red)),
          enabledBorder: BuildOutlinedInputBorde(),
          focusedBorder: BuildOutlinedInputBorde(),
          hintText: 'Search',
          suffixIconColor: KSecondColor,
          suffixIcon: const Opacity(
              opacity:.8,child: Icon(FontAwesomeIcons.magnifyingGlass))


          ),


      onSubmitted: (String SearchWords) {
        //print(SearchWords);
        x.fetchSearchedBooks(searchString: SearchWords);


      },

    );
  }
}

OutlineInputBorder BuildOutlinedInputBorde() {
  return OutlineInputBorder(

    borderSide: const BorderSide(color:Colors.white),
    borderRadius: BorderRadius.circular(15),
  );
}