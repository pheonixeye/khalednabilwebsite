import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/divider.dart';
import 'package:khalednabilwebsite/providers/exp_opacity_p.dart';
import 'package:khalednabilwebsite/sr_home_view/_widgets/about_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_widgets/book_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_widgets/contact_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_widgets/hero_div.dart';
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
              //divider
              DivContact(),
              //divider
              GlobalDivider(),
              // contact
              // footer
            ],
          ),
        );
      },
    );
  }
}
