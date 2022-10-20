import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/loading_animation_widget.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:provider/provider.dart';

class MainRoutePage extends StatefulWidget {
  const MainRoutePage({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  State<MainRoutePage> createState() => _MainRoutePageState();
}

class _MainRoutePageState extends State<MainRoutePage> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child ?? const LoadingAnimationWidget(),
    );
  }

  void _initLocale() {
    context.read<PxLocale>().setLocale();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    _initLocale();
  }
}
