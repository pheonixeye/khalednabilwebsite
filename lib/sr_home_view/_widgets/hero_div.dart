import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:khalednabilwebsite/exports/exports.dart';
import 'package:provider/provider.dart';

class DivHero extends StatefulWidget {
  const DivHero({Key? key}) : super(key: key);

  @override
  State<DivHero> createState() => _DivHeroState();
}

class _DivHeroState extends State<DivHero> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final _duration = const Duration(milliseconds: 5000);
  late Animation<double> _animation;
  late Animation<double> _changeValue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _animate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _animate() {
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _changeValue = Tween(begin: 0.0, end: 1.0).animate(_animation);
    _controller.forward(from: 0.0);
    _changeValue.addListener(() {
      setState(() {});
    });
    _changeValue.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(_duration);
        _controller.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionHeightHomepageView(context),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        shape: Styles.HEROCARDBORDER,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            //image
            Opacity(
              opacity: _controller.value,
              child: Image.asset(
                'images/hero_ph.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            //text
            //call to action
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Text(
                  context.loc.khaled_nabil,
                  style: TextStyle(
                    fontSize: isMobile(context) ? 26 : 42,
                    color: Colors.white,
                    decorationColor: Colors.amber,
                    decorationStyle: TextDecorationStyle.wavy,
                    shadows: [
                      BoxShadow(
                        offset: Offset(
                          _changeValue.value * 6,
                          _changeValue.value * 6,
                        ),
                        blurRadius: _changeValue.value * 6,
                        spreadRadius: _changeValue.value * 6,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  context.loc.spec,
                  style: TextStyle(
                    fontSize: isMobile(context) ? 22 : 38,
                    color: Colors.white,
                    decorationColor: Colors.amber,
                    decorationStyle: TextDecorationStyle.wavy,
                    shadows: const [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 3,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(
                  flex: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 300.0 / (_changeValue.value * 6),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context)
                          .go('/${context.read<PxLocale>().lang}/1');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        context.loc.book_app,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 300.0 / (_changeValue.value * 6),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context)
                          .go('/${context.read<PxLocale>().lang}/2');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        context.loc.services,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
