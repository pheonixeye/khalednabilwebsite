import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/exports/exports.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.loc.about),
    );
  }
}
