import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/models/navigation_m.dart';
import 'package:khalednabilwebsite/pages/pages.dart';
import 'package:khalednabilwebsite/providers/nav_index_p.dart';
import 'package:provider/provider.dart';

class PageViewHomepage extends StatefulWidget {
  const PageViewHomepage({Key? key}) : super(key: key);

  @override
  State<PageViewHomepage> createState() => _PageViewHomepageState();
}

class _PageViewHomepageState extends State<PageViewHomepage> {
  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PxNavIndex>(
      builder: (context, i, c) {
        return PageView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: isMobile(context) ? Axis.vertical : Axis.horizontal,
          controller: _pageController,
          itemCount: MxNavigation.NAVITEMS(context).length,
          itemBuilder: (context, index) {
            return Pages.pages[i.index];
          },
        );
      },
    );
  }
}
