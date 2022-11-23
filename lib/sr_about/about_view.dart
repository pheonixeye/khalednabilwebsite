import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/demo_text.dart';
import 'package:khalednabilwebsite/exports/exports.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DemoText(context.loc.about),
    );
  }
}
