import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/styles.dart';

class SocialWidet extends StatelessWidget {
  const SocialWidet(
      {Key? key,
      required this.text,
      required this.link,
      required this.icon,
      required this.color})
      : super(key: key);
  final String text, link;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          await launch(link);
        },
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
              color: color,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: Text(
              text,
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w900),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ))
          ],
        ),
      ),
    );
  }
}
