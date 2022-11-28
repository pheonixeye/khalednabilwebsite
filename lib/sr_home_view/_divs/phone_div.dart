import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/link_text.dart';
import 'package:khalednabilwebsite/functions/loc_ext_fns.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:provider/provider.dart';

class DivPhone extends StatelessWidget {
  const DivPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionHeightSocialFooter(context),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        shape: const RoundedRectangleBorder(),
        color: Styles.MAINPAGECOMPONENTCARDCOLOR,
        child: Row(
          children: [
            const Spacer(),
            Text(
              context.loc.phone,
              style: Styles.TITLESTEXTSYTYLE(context),
            ),
            const Spacer(),
            Consumer<PxLocale>(
              builder: (context, l, c) {
                const number = '01008788385';
                List<int> parsed = number.characters.map(int.parse).toList();
                bool isEnglish = l.lang == 'en';
                List<String> no =
                    parsed.map((e) => ArabicNumbers.convert(e)).toList();
                String arno = no.fold<String>('', (p, e) => p + e);

                return LinkText(
                  isEnglish ? number : arno,
                  style: Styles.TITLESTEXTSYTYLE(context),
                );
              },
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
