import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/styles/styles.dart';

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
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
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
      height: isMobile(context)
          ? MediaQuery.of(context).size.height * 0.5
          : MediaQuery.of(context).size.height * 0.7,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        shape: Styles.HEROCARDBORDER,
        child: Stack(
          children: [
            Opacity(
              opacity: _controller.value,
              child: Image.asset(
                'images/hero_ph.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
