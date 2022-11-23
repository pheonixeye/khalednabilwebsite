import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/styles/styles.dart';

class WhileValueEqualNullWidget extends StatelessWidget {
  const WhileValueEqualNullWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: Styles.CARDSHAPE,
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
