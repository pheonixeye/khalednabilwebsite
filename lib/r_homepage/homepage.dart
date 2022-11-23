import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/animated_fab.dart';
import 'package:khalednabilwebsite/providers/nav_index_p.dart';
import 'package:khalednabilwebsite/r_homepage/_widgets/page_view_w.dart';
import 'package:khalednabilwebsite/r_homepage/_widgets/persistent_sidebar.dart';
import 'package:khalednabilwebsite/functions/loc_ext_fns.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/r_homepage/_widgets/tab_nav_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.pageIndex = 0}) : super(key: key);
  final int? pageIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin {
  late final ScrollController _scrollController;
  double get _logoDimentions {
    return isMobile(context) ? 50 : 150;
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<PxNavIndex>().setIndex(widget.pageIndex!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: const MYFAB(),
      body: Opacity(
        opacity: 0.8,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bkgrnd2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isMobile(context)) const PersistentSideBar(),
              Flexible(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.white.withOpacity(0.4),
                        foregroundColor: Colors.white.withOpacity(0.4),
                        shadowColor: Colors.transparent,
                        //! logo
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/logo.png',
                              fit: BoxFit.scaleDown,
                              width: _logoDimentions,
                              height: _logoDimentions,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              context.loc.khaled_nabil,
                              style: TextStyle(
                                fontSize: isMobile(context) ? 22 : 36,
                                color: Colors.white,
                                decorationColor: Colors.amber,
                                decorationStyle: TextDecorationStyle.wavy,
                                shadows: const [
                                  BoxShadow(
                                    offset: Offset(3, 3),
                                    blurRadius: 3,
                                    spreadRadius: 3,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        bottom: isMobile(context) ? null : const NavTabBar(),
                      ),
                    ];
                  },
                  body: const PageViewHomepage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
