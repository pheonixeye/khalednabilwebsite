import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:khalednabilwebsite/language/app_localizations.dart';
import 'package:khalednabilwebsite/providers/_px_main.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:khalednabilwebsite/routes/routes.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) {
        return Consumer<PxLocale>(
          builder: (context, l, c) {
            return MaterialApp.router(
              title: 'Dr. Khaled Nabil Website',
              debugShowCheckedModeBanner: false,
              theme: Styles.LIGHTTHEMEDATA,
              routeInformationProvider: router.routeInformationProvider,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              builder: (context, child) {
                child = EasyLoading.init()(context, child);
                child = ResponsiveWrapper.builder(
                  child,
                  maxWidth:
                      MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                          .size
                          .width,
                  minWidth: 480,
                  defaultScale: true,
                  breakpoints: const [
                    ResponsiveBreakpoint.resize(480, name: MOBILE),
                    ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                    ResponsiveBreakpoint.autoScale(2460, name: '4K'),
                  ],
                );
                return child;
              },
              locale: l.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        );
      },
    );
  }
}
