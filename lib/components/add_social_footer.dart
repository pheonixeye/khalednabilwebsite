import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/divider.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/footer_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/social_div.dart';

List<Widget> get SOCIALFOOTER {
  return const [
    GlobalDivider(),
    DivSocial(),
    GlobalDivider(),
    DivFooter(),
  ];
}
