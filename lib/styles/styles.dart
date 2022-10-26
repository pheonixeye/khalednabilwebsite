// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';

class Styles {
  static const COLOR = Colors.blue;
  static const SCAFFOLDCOLOR = Colors.grey;

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

  static final LIGHTTHEMEDATA = ThemeData(
    primarySwatch: Styles.COLOR,
    fontFamily: 'Cairo',
    useMaterial3: true,
    scaffoldBackgroundColor: SCAFFOLDCOLOR.shade100,
  );
}
