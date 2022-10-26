import 'package:flutter/material.dart';

bool isMobile(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  if (width <= 480) {
    return true;
  } else {
    return false;
  }
}

double sectionHeightHomepageView(BuildContext context) {
  return isMobile(context)
      ? MediaQuery.of(context).size.height * 0.4
      : MediaQuery.of(context).size.height * 0.6;
}
