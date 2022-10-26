import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/exports/exports.dart';

class BeforeAfterView extends StatelessWidget {
  const BeforeAfterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.loc.beforeafter),
    );
  }
}
