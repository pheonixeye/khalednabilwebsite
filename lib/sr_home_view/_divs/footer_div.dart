// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/link_text.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/functions/tr_number.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:khalednabilwebsite/exports/exports.dart';

class DivFooter extends StatelessWidget {
  const DivFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionHeightSocialFooter(context),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        shape: Styles.ABOUTCARDBORDER,
        color: Styles.MAINPAGECOMPONENTCARDCOLOR,
        child: Center(
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${context.loc.rights}'
                ' ${trNumber(DateTime.now().year, context)}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinkText(
                context.loc.design,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                onTap: () {
                  window.open(
                    'https://kareemzaherportfolio.web.app',
                    'Kareem Zaher Portfolio',
                  );
                },
                align: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
