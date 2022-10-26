import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:khalednabilwebsite/r_homepage/homepage.dart';
import 'package:khalednabilwebsite/r_main_route_page/main_route_page.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  refreshListenable: PxLocale(),
  routes: [
    GoRoute(
      path: '/',
      name: 'mainroutepage',
      builder: (context, state) {
        return MainRoutePage(
          key: state.pageKey,
        );
      },
      redirect: (state) {
        if (state.fullpath == '/') {
          return '/ar/0';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: ':lang/:id',
          name: 'homepage',
          builder: (context, state) {
            final lang = state.params['lang'] as String;
            context.read<PxLocale>().setLang(lang);
            final key = ValueKey(lang);

            final pageStr = state.params['id'] as String;
            final page = int.parse(pageStr);
            final valueKeyIndex = ValueKey(page);
            // print(state.params);
            return MainRoutePage(
              key: key,
              child: HomePage(
                key: valueKeyIndex,
                pageIndex: page,
              ),
            );
          },
          redirect: (state) {
            if (state.params.length == 1) {
              return '/${state.params['lang']}/0';
            }
            return null;
          },
        ),
      ],
    ),
  ],
);
