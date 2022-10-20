import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khalednabilwebsite/functions/loc_ext_fns.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer<PxLocale>(
        builder: (context, l, c) {
          return FloatingActionButton(
            heroTag: 'fab',
            child: const Icon(Icons.language),
            onPressed: () {
              l.changeLocale();
              GoRouter.of(context).go('/${l.lang!}');
            },
          );
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(
              height: 20,
            ),
            Text(context.loc.khaled_nabil)
          ],
        ),
      ),
    );
  }
}
