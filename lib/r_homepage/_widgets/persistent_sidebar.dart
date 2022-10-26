import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khalednabilwebsite/models/navigation_m.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:khalednabilwebsite/providers/nav_index_p.dart';
import 'package:provider/provider.dart';

class PersistentSideBar extends StatefulWidget {
  const PersistentSideBar({Key? key}) : super(key: key);

  @override
  State<PersistentSideBar> createState() => _PersistentSideBarState();
}

class _PersistentSideBarState extends State<PersistentSideBar> {
  bool extended = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: Colors.white.withOpacity(0.4),
      width: extended ? 256 : 72,
      height: double.infinity,
      child: Consumer2<PxLocale, PxNavIndex>(
        builder: (context, l, i, c) {
          return NavigationRail(
            extended: extended,
            elevation: 10,
            backgroundColor: Colors.transparent,
            leading: const SizedBox(height: 50),
            groupAlignment: -0.5,
            labelType: NavigationRailLabelType.none,
            useIndicator: true,
            indicatorColor: Colors.amber,
            onDestinationSelected: (value) {
              i.setIndex(value);
              GoRouter.of(context).go('/${l.lang}/${i.index}');

              setState(() {
                extended = false;
              });
            },
            destinations: MxNavigation.NAVITEMS(context).map((e) {
              return NavigationRailDestination(
                icon: e.icon,
                label: e.text,
                padding: e.padding,
              );
            }).toList(),
            selectedIndex: i.index,
            trailing: Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    extended = !extended;
                  });
                },
                icon: Icon(
                  extended ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
