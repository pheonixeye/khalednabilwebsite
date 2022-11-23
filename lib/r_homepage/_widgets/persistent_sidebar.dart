import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khalednabilwebsite/models/navigation_m.dart';
import 'package:khalednabilwebsite/providers/exp_opacity_p.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:khalednabilwebsite/providers/nav_index_p.dart';
import 'package:provider/provider.dart';

class PersistentSideBar extends StatefulWidget {
  const PersistentSideBar({Key? key}) : super(key: key);

  @override
  State<PersistentSideBar> createState() => _PersistentSideBarState();
}

class _PersistentSideBarState extends State<PersistentSideBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PxExpOpacity>(
      builder: (context, e, c) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: Colors.white.withOpacity(0.4),
          width: e.exp ? MediaQuery.of(context).size.width : 72,
          height: double.infinity,
          child: Consumer2<PxLocale, PxNavIndex>(
            builder: (context, l, i, c) {
              return NavigationRail(
                extended: e.exp,
                elevation: 10,
                backgroundColor: Colors.transparent,
                leading: const SizedBox(height: 50),
                groupAlignment: -0.5,
                labelType: NavigationRailLabelType.none,
                useIndicator: true,
                indicatorColor: Colors.amber,
                selectedLabelTextStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                onDestinationSelected: (value) {
                  i.setIndex(value);
                  GoRouter.of(context).go('/${l.lang}/${i.index}');
                  e.exp ? e.toggle() : null;
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
                      e.toggle();
                    },
                    icon: Icon(
                      e.exp ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
