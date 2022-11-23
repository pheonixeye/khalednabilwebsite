import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/link_text.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:khalednabilwebsite/exports/exports.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({Key? key, required this.address}) : super(key: key);
  final String address;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        context.loc.address,
        style: Styles.TITLESTEXTSYTYLE(context),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LinkText(
          address,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Styles.ADAPTIVEFONTSIZE(context),
            color: Colors.white,
          ),
        ),
      ),
      dense: true,
    );
  }
}
