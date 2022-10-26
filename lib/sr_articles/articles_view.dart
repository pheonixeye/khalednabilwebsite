import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/exports/exports.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.loc.articles),
    );
  }
}
