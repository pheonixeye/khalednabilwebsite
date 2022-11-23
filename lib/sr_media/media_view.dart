import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/demo_text.dart';
import 'package:khalednabilwebsite/exports/exports.dart';

class MediaView extends StatelessWidget {
  const MediaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DemoText(
        context.loc.media,
      ),
    );
  }
}
