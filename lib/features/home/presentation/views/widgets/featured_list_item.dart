//import 'package:bookly/core/utils/dimentions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({Key? key, required this.imgUrl}) : super(key: key);
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
            fit: BoxFit.fill,
            placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
            imageUrl: Uri.parse(imgUrl??"").toString(),
            errorWidget: (context, url, error) {
              //print(imgUrl);

              return const Icon(Icons.error_outline);
            }),
      ),
    );
  }
}
