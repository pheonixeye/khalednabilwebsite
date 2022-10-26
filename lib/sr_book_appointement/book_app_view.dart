import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/exports/exports.dart';

class BookAppointementView extends StatelessWidget {
  const BookAppointementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.loc.book_app),
    );
  }
}
