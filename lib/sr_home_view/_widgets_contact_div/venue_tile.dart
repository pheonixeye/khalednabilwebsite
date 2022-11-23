import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/link_text.dart';
import 'package:khalednabilwebsite/exports/exports.dart';
import 'package:khalednabilwebsite/styles/styles.dart';

class VenueTile extends StatelessWidget {
  const VenueTile({Key? key, required this.venue}) : super(key: key);
  final String venue;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        context.loc.venue,
        style: Styles.TITLESTEXTSYTYLE(context),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LinkText(
          venue,
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
