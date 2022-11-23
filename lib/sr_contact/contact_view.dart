import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/demo_text.dart';
import 'package:khalednabilwebsite/exports/exports.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DemoText(context.loc.contact),
    );
  }
}
