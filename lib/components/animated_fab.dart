import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khalednabilwebsite/components/fab.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:khalednabilwebsite/providers/nav_index_p.dart';
import 'package:provider/provider.dart';

class MYFAB extends StatelessWidget {
  const MYFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedFloatingActionButton(
      fabButtons: [
        Consumer2<PxLocale, PxNavIndex>(
          builder: (context, l, i, c) {
            return FloatingActionButton(
              shape: const CircleBorder(),
              heroTag: 'l',
              child: const Icon(Icons.language),
              onPressed: () {
                l.changeLocale();
                i.setIndex(i.index);
                GoRouter.of(context).go('/${l.lang!}/${i.index}');
              },
            );
          },
        ),
        FloatingActionButton(
          shape: const CircleBorder(),
          heroTag: 'whatsapp',
          child: const Icon(Icons.message),
          onPressed: () {},
        ),
        FloatingActionButton(
          shape: const CircleBorder(),
          heroTag: 'call',
          child: const Icon(Icons.call),
          onPressed: () {},
        ),
        FloatingActionButton(
          shape: const CircleBorder(),
          heroTag: 'scrolltotop',
          child: const Icon(Icons.arrow_upward_rounded),
          onPressed: () {},
        ),
      ],
      animatedIconData: AnimatedIcons.menu_close,
    );
  }
}
