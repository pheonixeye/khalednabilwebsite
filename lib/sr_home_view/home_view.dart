import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/sr_home_view/_widgets/hero_div.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        //*homepage
        // hero with call to action
        DivHero(),
        // book
        // contact
        // footer
      ],
    );
  }
}
