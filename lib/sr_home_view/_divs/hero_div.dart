import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/null_value_widget.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/providers/px_hero_items_get.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:provider/provider.dart';

import '../_widgets_hero_div/_exp.dart';

class DivHero extends StatefulWidget {
  const DivHero({Key? key}) : super(key: key);

  @override
  State<DivHero> createState() => _DivHeroState();
}

class _DivHeroState extends State<DivHero> with AfterLayoutMixin {
  late Timer timer;
  late final PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      context.read<PxHeroItemsGet>().setPage();
      pageController.animateToPage(
        context.read<PxHeroItemsGet>().page,
        duration: const Duration(seconds: 1),
        curve: Curves.ease,
      );
    });
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await _initHeroItems();
  }

  Future _initHeroItems() async {
    await context.read<PxHeroItemsGet>().fetchHeroItems(context);
  }

  @override
  void dispose() {
    pageController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionHeightHomepageView(context),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        shape: Styles.HEROCARDBORDER,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            //image
            Consumer<PxHeroItemsGet>(
              builder: (context, h, c) {
                return PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  reverse: true,
                  itemCount: h.heroItems!.length,
                  controller: pageController,
                  onPageChanged: (value) {},
                  itemBuilder: (context, index) {
                    while (h.heroItems == null || h.heroItems!.isEmpty) {
                      return const WhileValueEqualNullWidget();
                    }
                    return MainHeroCard(
                      heroItemModel: h.heroItems![index],
                    );
                  },
                );
              },
            ),
            //call to action
            const CallToActionColumn(),
          ],
        ),
      ),
    );
  }
}
