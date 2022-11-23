import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/models/hero_item_model.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:provider/provider.dart';

class HeroTextPositioned extends StatelessWidget {
  const HeroTextPositioned(this.heroText, {Key? key}) : super(key: key);
  final HeroText heroText;
  @override
  Widget build(BuildContext context) {
    return Consumer<PxLocale>(
      builder: (context, l, c) {
        final style = Styles.HEROITEMTEXTSTYLE(heroText.fontSize);

        if (l.lang == 'en') {
          return Positioned(
            top: heroText.yPos,
            left: heroText.xPos,
            child: Text(
              heroText.textEn,
              style: style,
            ),
          );
        } else {
          return Positioned(
            top: heroText.yPos,
            right: heroText.xPos,
            child: Text(
              heroText.textAr,
              style: style,
            ),
          );
        }
      },
    );
  }
}
