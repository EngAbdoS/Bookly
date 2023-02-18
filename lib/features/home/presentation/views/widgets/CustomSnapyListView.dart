import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../../../../core/utils/constans.dart';
//import '../../../../../core/utils/dimentions.dart';
import '../../../data/models/booksModel.dart';
import 'featured_list_item.dart';

class SnapyList extends StatefulWidget {
  const SnapyList({Key? key, required this.itemState}) : super(key: key);
  final List<BooksModel> itemState;

  @override
  State<SnapyList> createState() => _SnapyListState();
}

class _SnapyListState extends State<SnapyList> {
  int _focusedIndex = 0;

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  Widget _buildListItem(BuildContext context, int index) {
    //horizontal
    return Padding(
      padding: const EdgeInsets.only(
          left: 15,
          top: 36,
          bottom: 48),
      child: GestureDetector(
        onTap: () => GoRouter.of(context)
            .push('/bookDetailsView', extra: widget.itemState[index]),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              //color: KPrimaryClor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45

                  // Color(0xFFe8e8e8)
                  ,
                  offset: Offset(-2, 5),
                  blurRadius: 9.0,
                ),
              ],
            ),
            child: CustomListViewItem(
              imgUrl:
                  '${widget.itemState[index].volumeInfo?.imageLinks?.thumbnail}',
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.height.toInt());
   // print("okk");
    return Container(

      height: MediaQuery.of(context).size.height.toInt()*0.397196,//340,
        //  color: Colors.red,
        //   height: Dimentions.pageview,
        color: KPrimaryClor,
        child: ScrollSnapList(
          scrollPhysics: const BouncingScrollPhysics(),
          onItemFocus: _onItemFocus,
          itemSize: MediaQuery.of(context).size.width.toInt()*0.465,///////3.15  189px
          itemBuilder: _buildListItem,
          itemCount: widget.itemState.length,
          dynamicItemSize: true,
          // dynamicSizeEquation: customEquation, //optional
        ),);
  }
}
