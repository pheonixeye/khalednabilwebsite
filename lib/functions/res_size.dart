import 'package:flutter/material.dart';

bool isMobile(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  if (width <= 480) {
    return true;
  } else {
    return false;
  }
}
