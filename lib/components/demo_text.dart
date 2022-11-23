import 'package:flutter/material.dart';

class DemoText extends StatelessWidget {
  const DemoText(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 32,
        color: Colors.white,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
