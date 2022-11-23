// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';

class Styles {
  static const COLOR = Colors.blue;

  static const SCAFFOLDCOLOR = Colors.grey;

  static const double MOBILEFONTSIZE = 14;

  static const double OTHERFONTSIZE = 20;

  static double ADAPTIVEFONTSIZE(BuildContext context) {
    return isMobile(context) ? MOBILEFONTSIZE : OTHERFONTSIZE;
  }

  static const HEROCARDBORDER = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );
  static const ABOUTCARDBORDER = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
  );

  static final CARDSHAPE = RoundedRectangleBorder(
    borderRadius: BorderRadiusDirectional.circular(20),
  );

  static final LIGHTTHEMEDATA = ThemeData(
    primarySwatch: Styles.COLOR,
    fontFamily: 'Cairo',
    useMaterial3: true,
    scaffoldBackgroundColor: SCAFFOLDCOLOR.shade100,
  );

  static TextStyle TITLESTEXTSYTYLE(BuildContext context) => TextStyle(
        fontSize: isMobile(context) ? 18 : 26,
        color: Colors.white,
        decorationColor: Colors.amber,
        decorationStyle: TextDecorationStyle.wavy,
        shadows: const [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 3,
            spreadRadius: 3,
            color: Colors.amber,
          ),
        ],
      );

  static final MAINPAGECOMPONENTCARDCOLOR = Colors.white.withOpacity(0.0);

  static TextStyle HEROITEMTEXTSTYLE(double fontSize) => TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        decorationColor: Colors.amber,
        decorationStyle: TextDecorationStyle.wavy,
        shadows: const [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 3,
            spreadRadius: 3,
            color: Colors.amber,
          ),
        ],
      );
}
