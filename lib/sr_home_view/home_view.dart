import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/divider.dart';
import 'package:khalednabilwebsite/sr_home_view/_widgets/about_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_widgets/hero_div.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        // contact
        // footer
      ],
    );
  }
}
