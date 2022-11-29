import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/divider.dart';
import 'package:khalednabilwebsite/providers/exp_opacity_p.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/book_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/footer_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/phone_div.dart';
import 'package:khalednabilwebsite/sr_home_view/_divs/social_div.dart';
import 'package:provider/provider.dart';

class BookAppointementView extends StatelessWidget {
  const BookAppointementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PxExpOpacity>(
      builder: (context, e, c) {
        return Opacity(
          opacity: e.exp ? 0.0 : 1.0,
          child: ListView(
            cacheExtent: 3000,
            children: const [
              DivBookApp(),
              GlobalDivider(),
              DivSocial(),
              GlobalDivider(),
              DivPhone(),
              GlobalDivider(),
              DivFooter(),
            ],
          ),
        );
      },
    );
  }
}
