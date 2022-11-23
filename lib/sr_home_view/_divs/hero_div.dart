import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/null_value_widget.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/providers/px_hero_items_get.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:provider/provider.dart';

import '../_widgets_hero_div/_exp.dart' deferred as wids;

class DivHero extends StatefulWidget {
  const DivHero({Key? key}) : super(key: key);

  @override
  State<DivHero> createState() => _DivHeroState();
}

class _DivHeroState extends State<DivHero> with AfterLayoutMixin {
  @override
  void initState() {
    super.initState();
    wids.loadLibrary();
  }

  int page = 0;
  late Timer timer;

  int _page() {
    return page + 1 >= context.read<PxHeroItemsGet>().heroItems!.length
        ? 0
        : page + 1;
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    _initHeroItems().then((value) {
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        pageController.animateToPage(
          _page(),
          duration: const Duration(seconds: 1),
          curve: Curves.ease,
        );
      });
    });
  }

  Future _initHeroItems() async {
    await context.read<PxHeroItemsGet>().fetchHeroItems(context);
  }

  final pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    timer.cancel();
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
                  reverse: true,
                  itemCount: h.heroItems!.length,
                  controller: pageController,
                  onPageChanged: (value) {
                    page = value;
                  },
                  itemBuilder: (context, index) {
                    while (h.heroItems == null || h.heroItems!.isEmpty) {
                      return const WhileValueEqualNullWidget();
                    }
                    return wids.MainHeroCard(
                      heroItemModel: h.heroItems![index],
                    );
                  },
                );
              },
            ),
            //call to action
            wids.CallToActionColumn(),
          ],
        ),
      ),
    );
  }
}
