import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/models/hero_item_model.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:provider/provider.dart';

class HeroTextUnpositioned extends StatelessWidget {
  const HeroTextUnpositioned({Key? key, required this.heroTextList})
      : super(key: key);
  final List<HeroText> heroTextList;
  @override
  Widget build(BuildContext context) {
    return Consumer<PxLocale>(
      builder: (context, l, c) {
        return Column(
          children: heroTextList.map((e) {
            final style = Styles.HEROITEMTEXTSTYLE(e.fontSize);

            if (l.lang == 'en') {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e.textEn,
                  style: style,
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e.textAr,
                  style: style,
                ),
              );
            }
          }).toList(),
        );
      },
    );
  }
}
