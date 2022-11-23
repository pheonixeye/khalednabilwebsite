import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/divider.dart';
import 'package:khalednabilwebsite/providers/exp_opacity_p.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/about_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/book_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/contact_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/footer_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/hero_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/social_div.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PxExpOpacity>(
      builder: (context, e, c) {
        return Opacity(
          opacity: e.exp ? 0.0 : 1.0,
          child: ListView(
            // controller: ScrollController(),
            cacheExtent: 3000,
            children: const [
              //*homepage
              // hero with call to action
              DivHero(),
              //divider
              GlobalDivider(),
              //about
              DivAbout(),
              //divider
              GlobalDivider(),
              // book
              DivBookApp(),
              //divider
              GlobalDivider(),
              //contact
              DivContact(),
              //divider
              GlobalDivider(),
              // social
              DivSocial(),
              // divider
              GlobalDivider(),
              // footer
              DivFooter(),
              // divider
              GlobalDivider(),
            ],
          ),
        );
      },
    );
  }
}
