import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/sr_home_view/_widgets_hero_div/book_app_hero_button.dart';
import 'package:khalednabilwebsite/sr_home_view/_widgets_hero_div/placeholder_text.dart';
import 'package:khalednabilwebsite/sr_home_view/_widgets_hero_div/services_hero_button.dart';

class CallToActionColumn extends StatelessWidget {
  const CallToActionColumn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Spacer(),
        PlaceHolderText(),
        SizedBox(
          height: 30,
        ),
        PlaceHolderText(),
        Spacer(
          flex: 2,
        ),
        BookAppHeroButton(),
        SizedBox(
          height: 10,
        ),
        ServicesHeroButton(),
        Spacer(),
      ],
    );
  }
}
