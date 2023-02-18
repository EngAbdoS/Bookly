
import 'package:flutter/material.dart';

//import '../../../../../core/utils/dimentions.dart';
import '../../../../../core/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String seconddtHalf;
  bool hiddentext = true;
  double textHeight = 150;//MediaQuery.of(context).size.height.toInt() / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      seconddtHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      seconddtHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: seconddtHalf.isEmpty
          ? SmallText(text: firstHalf,size:16,color: Colors.white,height: 1.8,)
          : Column(
              children: [
                SmallText(
                  text: hiddentext
                      ? (firstHalf + "...")
                      : (firstHalf + seconddtHalf),size:16,color: Colors.white,height: 1.8,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddentext = !hiddentext;

                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddentext?"Show more":"Show less",
                        color: Colors.grey
                      ),
                      Icon(
                       hiddentext? Icons.arrow_drop_down: Icons.arrow_drop_up,
                        color:  Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
