import 'package:bookly/core/utils/constans.dart';

import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/bookly_data/presentation/views/widgets/socialWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_flutter/widgets/icons.dart';
//import 'package:url_launcher/url_launcher.dart';

class SocialBox extends StatelessWidget {
  const SocialBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height.toInt() * .4,
      width: double.maxFinite,
      decoration: const BoxDecoration(
          color: KBoxColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SocialWidet(
                text: 'abdoo_swidan',
                link: 'https://www.instagram.com/abdoo_swidan/',
                icon: FontAwesomeIcons.instagram,
                color: Colors.pink),
            SocialWidet(
                text: 'Abdel_Rahman Swidan ',
                link: 'https://github.com/EngAbdoS',
                icon: FontAwesomeIcons.github,
                color: Colors.black),
            SocialWidet(
                text: 'sωiɒαи⁦( ͝° ͜ʖ͡°)ᕤ⁩',
                link: 'https://twitter.com/abd0_swidan',
                icon: FontAwesomeIcons.twitter,
                color: Colors.lightBlue),
            SocialWidet(
                text: 'Abdelrahman Swidan',
                link:
                    'https://www.linkedin.com/in/abdelrahman-swidan-57bb84235/',
                icon: FontAwesomeIcons.linkedin,
                color: Colors.blue),
            SocialWidet(
                text: ' swidan#6553',
                link: '',
                icon: FontAwesomeIcons.discord,
                color: Colors.green),
            SocialWidet(
                text: 'Abdelrahman Swidan',
                link: 'https://www.facebook.com/profile.php?id=100011068351633',
                icon: FontAwesomeIcons.facebook,
                color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
