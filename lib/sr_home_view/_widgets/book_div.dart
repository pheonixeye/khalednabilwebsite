import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/styles/styles.dart';

class DivBookApp extends StatelessWidget {
  const DivBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionHeightHomepageView(context),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        color: Colors.white.withOpacity(0.4),
        shape: Styles.HEROCARDBORDER,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            Center(
              child: Text('book app'),
            )
          ],
        ),
      ),
    );
  }
}
