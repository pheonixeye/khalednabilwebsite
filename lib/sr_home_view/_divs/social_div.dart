import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/link_text.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:khalednabilwebsite/exports/exports.dart';

class DivSocial extends StatelessWidget {
  const DivSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionHeightSocialFooter(context),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        shape: Styles.HEROCARDBORDER,
        color: Styles.MAINPAGECOMPONENTCARDCOLOR,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            LinkText(
              context.loc.follow,
              style: Styles.TITLESTEXTSYTYLE(context),
            ),
            const Spacer(
              flex: 2,
            ),
            SocialButton(
              heroTag: 'Facebook',
              onPressed: () {},
              backgroundColor: Colors.blue,
              child: const Icon(Icons.facebook),
            ),
            const Spacer(),
            SocialButton(
              heroTag: 'Instagram',
              onPressed: () {},
              backgroundColor: Colors.black,
              child: const Icon(Icons.camera),
            ),
            const Spacer(),
            SocialButton(
              heroTag: 'Youtube',
              onPressed: () {},
              backgroundColor: Colors.red,
              child: const Icon(Icons.play_arrow_rounded),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.heroTag,
    required this.child,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);
  final String heroTag;
  final Widget child;
  final Color backgroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: heroTag,
      child: isMobile(context)
          ? FloatingActionButton(
              heroTag: heroTag,
              backgroundColor: backgroundColor,
              onPressed: onPressed,
              child: child,
            )
          : FloatingActionButton.large(
              heroTag: heroTag,
              backgroundColor: backgroundColor,
              onPressed: onPressed,
              child: child,
            ),
    );
  }
}
