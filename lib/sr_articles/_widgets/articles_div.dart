import 'dart:async';
import 'dart:convert';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/no_items_in_list_card.dart';
import 'package:khalednabilwebsite/components/null_value_widget.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/providers/px_articles_get.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:provider/provider.dart';

class DivArticles extends StatefulWidget {
  const DivArticles({super.key});

  @override
  State<DivArticles> createState() => _DivArticlesState();
}

class _DivArticlesState extends State<DivArticles> with AfterLayoutMixin {
  final duration = const Duration(milliseconds: 400);
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await context.read<PxArticlesGet>().fetchArticles(context);
  }

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionHeightHomepageViewAboutDiv(context),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        shape: Styles.ABOUTCARDBORDER,
        color: Styles.MAINPAGECOMPONENTCARDCOLOR,
        child: Consumer<PxArticlesGet>(
          builder: (context, a, c) {
            while (a.articles == null) {
              return const WhileValueEqualNullWidget();
            }
            while (a.articles!.isEmpty) {
              return const NoItemsInListCard();
            }
            return Center(
              child: RotatedBox(
                quarterTurns: -1,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: isMobile(context)
                      ? MediaQuery.of(context).size.width - 75
                      : MediaQuery.of(context).size.height - 100,
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  offAxisFraction: -0.5,
                  squeeze: 1.1,
                  overAndUnderCenterOpacity: 0.9,
                  useMagnifier: true,
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: a.articles!.length,
                    builder: (context, index) {
                      return RotatedBox(
                        quarterTurns: 1,
                        child: AnimatedContainer(
                          width: selected == index ? 350 : 250,
                          height: selected == index ? 350 : 250,
                          duration: duration,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: Styles.CONTAINERDECORATION,
                          alignment: Alignment.center,
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.center,
                            children: [
                              if (a.articles![index].articleImage != null)
                                Image.memory(
                                  base64Decode(
                                      a.articles![index].articleImage!),
                                  fit: BoxFit.fill,
                                ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      a.articles![index].title,
                                      style: Styles.TITLESTEXTSYTYLE(context),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  if (a.articles![index].shortDescription !=
                                      null)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        a.articles![index].shortDescription!,
                                        style: Styles.TITLESTEXTSYTYLE(context),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  onSelectedItemChanged: (value) {
                    setState(() {
                      selected = value;
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
